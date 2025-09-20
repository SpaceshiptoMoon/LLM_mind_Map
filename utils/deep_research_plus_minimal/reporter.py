from typing import List
from schemas import ReportPiece, Finding, SectionPlan

def _fmt_evidence(ev):
    lines = []
    for e in ev[:6]:
        url = e.get('url','')
        title = e.get('title','source')
        snippet = e.get('snippet','')[:160].replace('\n',' ')
        lines.append(f"- [{title}]({url}) — {snippet}...")
    return "\n".join(lines)

def piece_to_md(piece: ReportPiece) -> str:
    md = [f"## {piece['section']}",
          f"**Section confidence:** {piece['confidence']:.2f}\n"]
    if piece["conclusions"]:
        md.append("### Conclusions")
        for f in piece["conclusions"]:
            md.append(f"- {f['claim']}\n{_fmt_evidence(f['evidence'])}")
    if piece["counterarguments"]:
        md.append("### Counterarguments / Open questions")
        for f in piece["counterarguments"]:
            md.append(f"- {f['claim']}\n{_fmt_evidence(f['evidence'])}")
    return "\n".join(md)

def compose_report(topic: str, plans: List[SectionPlan], pieces: List[ReportPiece]) -> str:
    head = f"# Deep Research Report: {topic}\n\n"
    toc = "## Table of Contents\n" + "\n".join([f"- {i+1}. {p['title']}" for i,p in enumerate(plans)]) + "\n\n"
    body = "\n\n".join([piece_to_md(p) for p in pieces])
    return head + toc + body
