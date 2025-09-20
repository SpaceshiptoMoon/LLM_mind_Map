from pydantic import BaseModel
import mysql.connector
from mysql.connector import Error
from fastapi import HTTPException
from typing import List, Optional
import json
from utils.color_tool import generate_single_color_gradient

# 数据模型
'''
数据库设计​：

单元表(units)：存储课程单元信息

知识点表(knowledge_points)：关联单元，包含知识点描述和难度

能力项表(capabilities)：存储金融合规、数智技术等维度标签

资源表(resources)：存储PDF、视频等资源，关联能力项
'''

# 读取配置文件
def load_dbconfig():
    """
    读取数据库配置文件
    Returns:
        json : 数据库配置信息
    """
    with open("utils\configs\db_config.json", 'r', encoding='utf-8') as f:  
        DB_CONFIG = json.load(f)
    return DB_CONFIG

# 数据库连接函数
def get_db_connection():
    """
    连接数据库
    """
    DB_CONFIG = load_dbconfig()

    try:
        connection = mysql.connector.connect(**DB_CONFIG)
        return connection
    except Error as e:
        print(f"Error connecting to MySQL: {e}")
        return None

# 初始化数据库表
def init_db():
    """
    初始化数据库
    """
    connection = get_db_connection()
    if connection:
        try:
            cursor = connection.cursor()
            
            # 创建单元表
            cursor.execute("""
                    CREATE TABLE IF NOT EXISTS units  (
                    unit_id INT AUTO_INCREMENT PRIMARY KEY,
                    name VARCHAR(100) NOT NULL,
                    course_id INT NOT NULL
                    )
            """)
            
            # 创建知识点表
            cursor.execute("""
                CREATE TABLE IF NOT EXISTS knowledge_points (
                    point_id INT AUTO_INCREMENT PRIMARY KEY,
                    unit_id INT NOT NULL,
                    description TEXT NOT NULL,
                    difficulty VARCHAR(20),
                    FOREIGN KEY (unit_id) REFERENCES units(unit_id)
                )
            """)
            
            # 创建能力项表
            cursor.execute("""
                CREATE TABLE IF NOT EXISTS capabilities (
                    capability_id INT AUTO_INCREMENT PRIMARY KEY,
                    name VARCHAR(100) NOT NULL,
                    category VARCHAR(50) NOT NULL,
                    subcategory VARCHAR(50) NOT NULL,
                    point_id INT NOT NULL,
                    FOREIGN KEY (point_id) REFERENCES knowledge_point(point)
                )
            """)
            
            
            # 创建资源表
            cursor.execute("""
                CREATE TABLE IF NOT EXISTS resources (
                    resource_id INT AUTO_INCREMENT PRIMARY KEY,
                    capability_id INT NOT NULL,
                    name VARCHAR(100) NOT NULL,
                    type VARCHAR(20) NOT NULL,
                    url TEXT NOT NULL,
                    FOREIGN KEY (capability_id) REFERENCES capabilities(capability_id)
                )
            """)
            
            connection.commit()
            print("Database tables created successfully")
        except Error as e:
            print(f"Error creating tables: {e}")
        finally:
            if connection.is_connected():
                cursor.close()
                connection.close()

# 初始化数据库
init_db()

# 生成思维导图数据的核心函数
def generate_mindmap_data(course_id: int)->Optional[dict]:
    '''
    从数据库获取所有相关数据，并构建前端所需的思维导图数据结构
    数据结构按照单元→知识点→能力项→资源的层级组织
    每个节点包含ID和topic，以及可能的子节点
    '''
    connection = get_db_connection()
    if not connection:
        raise HTTPException(status_code=500, detail="Database connection failed")
    
    try:
        cursor = connection.cursor(dictionary=True)
        
        # 1. 获取所有单元
        cursor.execute("SELECT * FROM units WHERE course_id = %s", (course_id,))
        units = cursor.fetchall()
        
        if not units:
            return {"error": "No units found for this course"}
        
        
        predefined_colors = [
            "#F1886E", '#33FF57', '#3357FF', '#F1C40F', '#8E44AD',
            '#E74C3C', '#2ECC71', '#3498DB', '#1ABC9C', '#FF33A6',
            '#33FFEC', '#B533FF', '#FF3333', '#33FF33', '#3333FF',
            '#FFFF33', '#FF33FF', '#33FFFF'
        ]

        
        # 构建思维导图数据结构
        mindmap = {
            "meta": {
                "name": f"课程图谱-课程ID:{course_id}",
                "author": "天择教育科技公司",
                "version": "1.0"
            },
            "format": "node_tree",
            "data": {
                "id": "root",
                "topic": f"课程ID:{course_id}",
                "children": []
            }
        }
        
        # 2. 为每个单元添加子节点
        for unit in units:
            unit_color_id = int(unit['unit_id']) % len(predefined_colors)
            unit_color = predefined_colors[unit_color_id]
            unit_node = {
                "id": f"unit_{unit['unit_id']}",
                "topic": unit['name'],
                "itemStyle":{"color": unit_color},
                "children": []
            }
            
            # 3. 获取该单元下的所有知识点
            cursor.execute("SELECT * FROM knowledge_points WHERE unit_id = %s", (unit['unit_id'],))
            knowledge_points = cursor.fetchall()
            
            for point in knowledge_points:
                point_color = generate_single_color_gradient(unit_color)[-100]
                point_node = {
                    "id": f"point_{point['point_id']}",
                    "topic": f"{point['description']} (难度: {point['difficulty']})",
                    "itemStyle":{"color": point_color},
                    "children": []
                }
                
                # 4. 获取该知识点关联的所有能力项
                cursor.execute("SELECT * FROM capabilities WHERE point_id = %s", (point['point_id'],))
                capabilities = cursor.fetchall()
                
                for capability in capabilities:
                    capability_color = generate_single_color_gradient(point_color)[-100]
                    capability_node = {
                        "id": f"cap_{capability['capability_id']}",
                        "topic": f"{capability['category']}/{capability['subcategory']}: {capability['name']}",
                        "itemStyle":{"color": capability_color},
                        "children": []
                    }
                    
                    # 5. 获取该能力项下的所有资源
                    cursor.execute("SELECT * FROM resources WHERE capability_id = %s", (capability['capability_id'],))
                    resources = cursor.fetchall()
                    
                    for resource in resources:
                        resource_color = generate_single_color_gradient(capability_color)[-100]
                        resource_node = {
                            "id": f"res_{resource['resource_id']}",
                            "topic": f"{resource['type']}: {resource['name']}",
                            "itemStyle":{"color": resource_color},
                            "data": {"url": resource['url']}
                        }
                        capability_node["children"].append(resource_node)
                    
                    point_node["children"].append(capability_node)
                
                unit_node["children"].append(point_node)
            
            mindmap["data"]["children"].append(unit_node)
        
        return mindmap
    
    except Error as e:
        print(f"Error generating mindmap: {e}")
        raise HTTPException(status_code=500, detail="Error generating mindmap data")
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()

# 获取所有课程列表
def generate_course_id()->Optional[dict]:
    '''
    从数据库获取所有course_id
    '''
    connection = get_db_connection()
    if not connection:
        raise HTTPException(status_code=500, detail="Database connection failed")
    
    try:
        cursor = connection.cursor()
        cursor.execute("SELECT DISTINCT course_id FROM units")
        courses_id = cursor.fetchall()
        print(courses_id)
        return courses_id
    except Error as e:
        print(f"Error generating mindmap: {e}")
        raise HTTPException(status_code=500, detail="Error generating mindmap data")
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            
            
# print(generate_mindmap_data(101))