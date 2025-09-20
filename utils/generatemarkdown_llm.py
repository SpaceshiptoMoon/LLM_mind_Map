from utils.database_tools.resource_info import  load_llm_input
from utils.deep_research_plus_minimal.run import drllm
from typing import Dict

def generate_knowledge(course_id: int) -> Dict[str, str]:
    """
    根据课程ID获取数据库信息,生成相关课程的信息和文件名。
    
    Args:
        course_id (int): 课程的唯一标识ID
        
    Returns:
        Dict[str, str]:返回{对应保存文件路径: 课程ID的详细信息}
    """
    
    infos = {}
    for path_info in load_llm_input(course_id):
        parts = path_info.split('//')
        infos[parts[1]] = parts[0]
        
    for file_name, query in infos.items():
        query = query.split('/')
        str_query = f'单元名:{query[0]}, 知识点: {query[1]}, 难度{query[2]}, 能力项:{query[5]}{query[3]}, 知识点名称:{query[6]}'
        infos[file_name] = str_query
    return infos
       
def mk_resource_files(course_id: int) -> None:
    """
    根据课程ID生成所有知识资源文件,保存在resources文件夹下。
    
    Args:
        course_id (int): 课程的唯一标识ID
    """    
    infos = generate_knowledge(course_id)
    
    # for file_name, query in infos.items():
    #     drllm(query, file_name)
    
    return '成功生成所有知识资源！'

if __name__ == '__main__':
    gt_kn = mk_resource_files(101)
    print(generate_knowledge(101))
    # print(gt_kn)
    # save_report('dasdasf', 'resources/dasf.md')
    pass