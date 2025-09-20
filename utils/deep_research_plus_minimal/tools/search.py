from typing import List, Dict, Any
from utils.deep_research_plus_minimal.config import settings

def _tavily_search(q: str, k: int = 5) -> List[Dict[str, Any]]:
    from tavily import TavilyClient
    tv = TavilyClient(api_key=settings.tavily_key)
    res = tv.search(q, max_results=k)
    out = []
    for r in res.get("results", []):
        out.append({"url": r.get("url"), "title": r.get("title"), "snippet": r.get("content"), "score": r.get("score", 0)})
    return out

def _ddg_search(q: str, k: int = 5) -> List[Dict[str, Any]]:
    try:
        from ddgs import DDGS
    except ImportError:
        try:
            from duckduckgo_search import DDGS
        except ImportError:
            print("请安装 ddgs 包: pip install ddgs")
            return []
    
    import time
    out = []
    try:
        with DDGS() as ddgs:
            for r in ddgs.text(q, max_results=k):
                out.append({"url": r.get("href"), "title": r.get("title"), "snippet": r.get("body"), "score": 0})
    except Exception as e:
        print(f"DuckDuckGo 搜索出错: {e}")
        # 返回一些模拟数据作为备用
        out = [
            {"url": "https://example.com", "title": f"关于 {q} 的搜索结果", "snippet": f"这是关于 {q} 的相关信息。", "score": 0}
        ]
    # print(out)
    return out

def web_search(query: str, k: int = 5) -> List[Dict[str, Any]]:
    api = settings.search_api.lower()
    if api == "tavily":
        return _tavily_search(query, k)
    if api == "duckduckgo":
        return _ddg_search(query, k)
    return []
