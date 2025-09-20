import mysql.connector
from typing import List
from mysql.connector import Error
from fastapi import HTTPException
from utils.database_tools.db_operation import get_db_connection

def load_resource_urls():
    """
    获取url的目录

    Returns:
        返回一个列表，列表里为url相对路径
    """
    connection = get_db_connection()
    
    if connection:
        try:
            cursor = connection.cursor(dictionary=True)
            cursor.execute("SELECT url FROM resources ")
            urls = cursor.fetchall()
            
            if not urls:
                return {"error":"No units found for this course"}
            
            return urls
            
        except Error as e:
            raise HTTPException(status_code=500, detail="Error generating mindmap data")
        
        finally:
            if connection.is_connected():
                cursor.close()
                connection.close()

def load_llm_input(course_id:int) -> List[str]:
    connection = get_db_connection()
    
    if not connection:
        raise HTTPException(status_code=500, detail="Database connection failed")

    path_str_ls:list = []
    if connection:
        try:
            cursor = connection.cursor(dictionary=True)
            cursor.execute("SELECT * FROM units WHERE course_id=%s", (course_id,))
            units = cursor.fetchall()           
            
            if not units:
                return {"error": "No units found for this course"}
            
            for unit in units:
                unit_foreige_key = unit['unit_id']
                unit_info = unit['name']            
                
                cursor.execute("SELECT * FROM knowledge_points WHERE unit_id = %s", (unit_foreige_key,))
                knowledge_points = cursor.fetchall()
                                
                for point in knowledge_points:
                    point_foreige_key = point['point_id']
                    point_description = point['description']
                    point_difficulty = point['difficulty']
                    point_info = '/'.join([unit_info, point_description, point_difficulty])                
                
                    # 4. 获取该知识点关联的所有能力项
                    cursor.execute("SELECT * FROM capabilities WHERE point_id = %s", (point_foreige_key,))
                    capabilities = cursor.fetchall()
                    
                    for capability in capabilities:
                        capability_foreige_key = capability['capability_id']
                        capability_name = capability['name']
                        capability_category = capability['category']
                        capability_subcategory = capability['subcategory']
                        capability_info = '/'.join([point_info, capability_name, capability_category, capability_subcategory])                        
                        
                        cursor.execute("SELECT * FROM resources WHERE capability_id=%s", (capability_foreige_key, ))
                        resources = cursor.fetchall()
                        
                        for resource in resources:
                            resource_name = resource['name']
                            resource_url = resource['url']
                            resource_info = '/'.join([capability_info, resource_name, resource_url])
                            path_str_ls.append(resource_info)
            return path_str_ls
        except Error as e:
            print(f"Error generating mindmap: {e}")
            raise HTTPException(status_code=500, detail="Error generating mindmap data")
        finally:
            if connection.is_connected:
                cursor.close()
                connection.close()

# if __name__ == "__main__":
#     print(load_llm_input(101))