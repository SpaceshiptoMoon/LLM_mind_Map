from typing import List, Dict, Any
from schemas import Finding

FACT_PROMPT = """You are a strict fact-checker.
For each claim and its evidence list (urls/snippets), produce a JSON array with items:
{ "verdict": "supported" | "weak" | "contradicted", "confidence": 0.0-1.0, "note": "short reason" }
Number of items must equal number of input claims.
"""

def fact_check(findings: List[Finding]) -> List[Dict[str, Any]]:
    from langchain.chat_models import init_chat_model
    from langchain_core.messages import SystemMessage, HumanMessage
    from ustils.config.config import settings
    import json
    llm = init_chat_model(settings.llm_model, model_provider=settings.llm_provider, temperature=0)
    payload = [{"claim": f["claim"], "evidence": f["evidence"]} for f in findings]
    msg = llm.invoke([
        SystemMessage(content="Reply in valid JSON only."),
        HumanMessage(content=FACT_PROMPT + "\nINPUT:\n" + json.dumps(payload)[:100000])
    ])
    try:
        return json.loads(msg.content)
    except Exception:
        return [{"verdict":"weak","confidence":0.5,"note":"fallback"} for _ in findings]
