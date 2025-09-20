from typing import List
from utils.deep_research_plus_minimal.tools.search import web_search
from utils.deep_research_plus_minimal.schemas import Finding

def research_one(state) -> dict:
    findings = []
    
    # 从状态中获取问题
    query = state.get('query', '')
    work_items = state.get('work_items', [])
    
    if work_items:
        subquestion = work_items[0]  # 处理第一个问题
        results = web_search(subquestion, k=5)
        if results:
            findings.append({
                "claim": f"Preliminary findings for: {subquestion}",
                "evidence": results, 
                "source_type": "web"
            })
    
    return {"partial_results": findings}
