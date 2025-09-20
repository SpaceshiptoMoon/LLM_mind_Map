import uuid
import argparse
import os
from datetime import datetime
from utils.deep_research_plus_minimal.graph import build_graph


def save_report(content, file_name):
    """保存研究报告为 markdown 文件"""
    # 生成文件名：使用查询主题的前20个字符，避免文件名过长
    safe_query = file_name.split('/')
    # safe_query = safe_query.replace(' ', '_')
    
    # 获取资源文件夹
    filename = safe_query[-1]
    dir_path = os.path.join(os.getcwd(), safe_query[0])
    filename = os.path.join(dir_path, filename)
    
    # 保存文件
    with open(filename, 'w', encoding='utf-8') as f:
        f.write(content)

    return filename

def drllm(query:str, file_name:str, breadth:int=2, depth:int=3)->None:
    """
    使用深度研究语言模型生成教学资料。
    
    该函数通过命令行参数配置研究参数，调用研究图谱生成详细的教学资料，
    并支持将报告保存到文件或同时输出到控制台。

    Args:
        query (str): 研究主题或查询内容。
        file_name (str): 保存研究报告的文件名（不含扩展名）。
        breadth (int, optional): 研究广度，控制研究范围的广泛程度。默认为2。
        depth (int, optional): 研究深度，控制研究内容的详细程度。默认为3。

    Returns:
        None: 此函数不返回任何值，结果通过文件输出和/或控制台打印。

    Raises:
        Exception: 如果研究图谱调用或报告生成过程中出现错误。

    Notes:
        - 研究报告以Markdown格式生成和保存
        - 默认情况下会同时保存文件和打印到控制台
        - 使用 `--save-only` 参数可禁止控制台输出

    Example:
        >>> drllm("人工智能发展趋势", "AI研究报告")
        >>> # 或在命令行中调用：
        >>> # python script.py --query "人工智能" --breadth 3 --depth 2
    """
    parser = argparse.ArgumentParser(description='深度研究工具')
    parser.add_argument('--query', type=str, default=query, 
                       help='研究主题')
    parser.add_argument('--breadth', type=int, default=3, 
                       help='研究广度')
    parser.add_argument('--depth', type=int, default=2, 
                       help='研究深度')
    parser.add_argument('--save-only', action='store_true',
                       help='仅保存文件，不打印到控制台')
    
    args = parser.parse_args()
    
    print(f"开始研究主题: {args.query}")
    print(f"研究参数: 广度={args.breadth}, 深度={args.depth}")
    print("正在生成研究报告...")
    
    app = build_graph()
    init_state = {
        "query": args.query,
        "breadth": args.breadth,
        "depth": args.depth
    }
    
    try:
        final = app.invoke(init_state, {"configurable": {"thread_id": str(uuid.uuid4())}})
        report_content = final["final_report_md"]
        
        # 保存报告
        filename = save_report(report_content, file_name)
        print(f"\n✅ 研究报告已保存到: {filename}")
        
        # 根据参数决定是否打印到控制台
        if not args.save_only:
            print("\n=== 正式研究报告 ===\n")
            print(report_content)
        
    except Exception as e:
        print(f"❌ 生成报告时出错: {e}")
        return

# if __name__ == "__main__":
#     # drllm('adsa')
#     save_report('asdsa', 'faf')
