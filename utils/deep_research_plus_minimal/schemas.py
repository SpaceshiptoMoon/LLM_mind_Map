from typing import TypedDict, List, Dict, Any

class Finding(TypedDict):
    claim: str
    evidence: List[Dict[str, Any]]
    source_type: str

class SectionPlan(TypedDict):
    title: str
    questions: List[str]

class ReportPiece(TypedDict):
    section: str
    conclusions: List[Finding]
    counterarguments: List[Finding]
    confidence: float

class ResearchState(TypedDict):
    query: str
    breadth: int
    depth: int
    plans: List[SectionPlan]
    work_items: List[str]
    partial_results: List[ReportPiece]
    final_report_md: str | None
