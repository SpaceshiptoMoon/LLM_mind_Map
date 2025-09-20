from fastapi import FastAPI, HTTPException, Response, status
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import FileResponse
import uvicorn
import os 
from utils.database_tools.db_operation import generate_mindmap_data, generate_course_id
from utils.database_tools.resource_info import load_llm_input
#from utils.generatemarkdown_llm import mk_resource_files 
from typing import Dict
from api.xinglang import connect, router as stock_router


app = FastAPI(docs_url=False, redoc_url=False)
app.include_router(stock_router, prefix="/stock", tags=["股票数据"])

# 允许跨域请求
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.post("/generate-resources/{course_id}", 
          summary="生成课程知识资源",
          description="根据课程ID，异步生成所有相关的知识资源文件。",
          response_model=Dict[str, str])
async def generate_resources(course_id: int):
    """
    根据课程ID生成所有知识资源文件的接口。
    
    arg:
        course_id: 课程的唯一标识ID
    """
    
    try:
        course_id_info = load_llm_input(course_id)
        for path in course_id_info:
            if path.split('/')[-1] in os.listdir('resources'):
                result = f'{course_id}课程知识点已经生成！'
                return {"status": "success", 'message':result}
            else:
                # result = mk_resource_files(course_id)
                return {"status": "success", "message": "资源生成失败"}
    except Exception as e:
        # 处理可能出现的异常，返回错误信息
        raise HTTPException(status_code=500, detail=f"资源生成失败: {str(e)}")
        
# API端口(获取course_id底下的所有数据)
@app.get("/mindmap/{course_id}", response_model=dict)
async def get_mindmap(course_id: int):
    """
        获取course_id底下的所有数据
    """
    return generate_mindmap_data(course_id)

# API端口(获取所有的cursor_id)
@app.get("/get_units/", response_model=list)
async def create_unit():
    """
        获取所有的cursor_id
    """
    return generate_course_id()


if __name__ == "__main__":
    connect()
    import uvicorn
    uvicorn.run('app_fastapi:app', host="0.0.0.0", port=8000,reload=True)
