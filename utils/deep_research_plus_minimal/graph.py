from langgraph.graph import StateGraph
from utils.deep_research_plus_minimal.agents.supervisor import plan_sections
from utils.deep_research_plus_minimal.agents.researcher import research_one
from utils.deep_research_plus_minimal.agents.writer import write_report
from utils.deep_research_plus_minimal.schemas import ResearchState

def node_plan(state):
    return plan_sections(state)

def node_research(state):
    return research_one(state)

def node_summarize(state):
    return write_report(state)

def build_graph():
    workflow = StateGraph(ResearchState)
    workflow.add_node("plan", node_plan)
    workflow.add_node("research", node_research)
    workflow.add_node("summarize", node_summarize)

    workflow.add_edge("plan", "research")
    workflow.add_edge("research", "summarize")

    workflow.set_entry_point("plan")
    workflow.set_finish_point("summarize")
    return workflow.compile()
