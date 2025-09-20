import os
from pydantic import BaseModel
from dotenv import load_dotenv

load_dotenv()

class Settings(BaseModel):
    llm_provider: str = os.getenv("LLM_PROVIDER", "openai")
    llm_model: str = os.getenv("LLM_MODEL", "gpt-4o-mini")
    search_api: str = os.getenv("SEARCH_API", "duckduckgo")
    tavily_key: str | None = os.getenv("TAVILY_API_KEY")
    exa_key: str | None = os.getenv("EXA_API_KEY")
    default_breadth: int = int(os.getenv("DEFAULT_BREADTH", 4))
    default_depth: int = int(os.getenv("DEFAULT_DEPTH", 2))
    mcp_enabled: bool = os.getenv("MCP_ENABLED", "false").lower() == "true"
    mcp_filesystem_dir: str | None = os.getenv("MCP_FILESYSTEM_DIR")

settings = Settings()
print(settings)