# llm.py
import os
from langchain_openai import ChatOpenAI
from dotenv import load_dotenv

load_dotenv()
# 从环境变量读取配置
LLM_PROVIDER = os.getenv("LLM_PROVIDER", "openai")
LLM_MODEL = os.getenv("LLM_MODEL", "gpt-4o-mini")  # 默认使用更便宜的模型

def get_llm():
    """根据环境变量配置返回相应的 LLM"""
    if LLM_PROVIDER == "openai":
        api_key = os.getenv("OPENAI_API_KEY")
        print(api_key)
        if not api_key:
            raise ValueError("请先设置 OPENAI_API_KEY 环境变量")
        return ChatOpenAI(
            model=LLM_MODEL,
            temperature=0,
            api_key=api_key,
            base_url="https://dashscope.aliyuncs.com/compatible-mode/v1",
            extra_body={"enable_thinking": False}
        )
    else:
        raise ValueError(f"不支持的 LLM 提供商: {LLM_PROVIDER}")

# 初始化 LLM
llm = get_llm()

if __name__ == "__main__":
    print(llm)