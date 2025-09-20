from langchain.schema import SystemMessage, HumanMessage
from utils.deep_research_plus_minimal.llm import llm
from utils.deep_research_plus_minimal.template import SYSTEM_PLAN


def plan_sections(state):
    prompt = SYSTEM_PLAN.format(state['query']) + f"\n主题: {state['query']}\n请直接给出研究子知识点的JSON列表。"
    msg = llm.invoke([SystemMessage(content="Reply in pure JSON."), HumanMessage(content=prompt)])
    return {"sections": msg.content}
