from fastapi import FastAPI, Query, APIRouter
import uvicorn, requests, re, random, string
import pymysql
from pymysql.cursors import DictCursor
from datetime import datetime


# -------------------------- 1. 基础工具函数 --------------------------
def extract_multi_stock_info(raw_multi_data):
    """解析新浪股票数据（用于初始化四张表的基础数据）"""
    stock_pattern = re.compile(r'var hq_str_([a-z0-9]+)="(.*?)";', re.IGNORECASE)
    stock_matches = stock_pattern.findall(raw_multi_data)
    if not stock_matches:
        print(f"未匹配到股票数据！原始响应前500字符：{raw_multi_data[:500]}")
        return []

    all_stock_info = []
    for stock_code, data_str in stock_matches:
        data_list = data_str.split(",")
        try:
            # 统一数据格式，避免空值和类型错误
            stock_info = {
                "stock_code": stock_code,
                "stock_name": data_list[0] if len(data_list) > 0 else "未知名称",
                "opening_price": float(data_list[1]) if len(data_list) > 1 and data_list[1] else 0.00,
                "previous_close": float(data_list[2]) if len(data_list) > 2 and data_list[2] else 0.00,
                "current_price": float(data_list[3]) if len(data_list) > 3 and data_list[3] else 0.00,
                "highest_price": float(data_list[4]) if len(data_list) > 4 and data_list[4] else 0.00,
                "lowest_price": float(data_list[5]) if len(data_list) > 5 and data_list[5] else 0.00,
                "collect_time": datetime.now().strftime("%Y-%m-%d %H:%M:%S")  # 统一采集时间
            }
            all_stock_info.append(stock_info)
        except Exception as e:
            print(f"解析股票 {stock_code} 失败：{str(e)}")
            continue
    return all_stock_info


def treat_data(data_list):
    """转换为前端表格标准格式（含表头和数据）"""
    return {
        "columns": [
            {"title": "股票代码", "dataIndex": "stock_code", "key": "stock_code"},
            {"title": "股票名称", "dataIndex": "stock_name", "key": "stock_name"},
            {"title": "今日开盘价", "dataIndex": "opening_price", "key": "opening_price"},
            {"title": "昨日收盘价", "dataIndex": "previous_close", "key": "previous_close"},
            {"title": "当前价", "dataIndex": "current_price", "key": "current_price"},
            {"title": "最高价", "dataIndex": "highest_price", "key": "highest_price"},
            {"title": "最低价", "dataIndex": "lowest_price", "key": "lowest_price"},
            {"title": "采集时间", "dataIndex": "collect_time", "key": "collect_time"}
        ],
        "data": data_list
    }


def get_sina_init_data():
    """获取新浪股票数据（仅用于初始化四张表）"""
    headers = {
        "Accept": "*/*",
        "Accept-Language": "zh-CN,zh;q=0.9",
        "Cache-Control": "no-cache",
        "Connection": "keep-alive",
        "Pragma": "no-cache",
        "Referer": "https://vip.stock.finance.sina.com.cn/",
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36"
    }
    # 随机参数防缓存
    rn = ''.join(random.choices(string.ascii_lowercase + string.digits, k=6))
    stock_list = "bj832000,bj872351,sz300959,sh688766,sz300043,sz300013,sz300007,sh688047"  # 精简股票列表
    url = f"https://hq.sinajs.cn/rn={rn}&list={stock_list}"

    try:
        response = requests.get(url, headers=headers, timeout=10)
        response.encoding = "gbk"  # 新浪接口默认GBK编码
        return extract_multi_stock_info(response.text)
    except Exception as e:
        print(f"获取新浪初始化数据失败：{str(e)}")
        return []


# -------------------------- 2. 数据库核心类（分表管理+同数据初始化） --------------------------
class StockDatabase:
    def __init__(self, db_name='mindmap'):
        # 数据库配置（请根据实际环境修改）
        self.config = {
            'host': '120.78.220.29',
            'user': 'root',
            'password': 'sztzjy2017',
            'port': 3307,
            'charset': 'utf8mb4',
            'cursorclass': DictCursor,
            'connect_timeout': 10
        }
        self.db_name = db_name
        self.connection = None
        # 四张分时段表映射（核心：参数对应表名）
        self.table_map = {
            "seconds": "stock_seconds",  # 每秒表
            "minutes": "stock_minutes",  # 每分钟表
            "hours": "stock_hours",  # 每小时表
            "days": "stock_days"  # 每天表
        }

    def connect_without_db(self):
        """无数据库连接（用于创建数据库）"""
        try:
            config = self.config.copy()
            config.pop('db', None)
            conn = pymysql.connect(**config)
            print(f"[DB] 无库连接成功")
            return conn
        except Exception as e:
            print(f"[DB] 无库连接失败：{str(e)}")
            return None

    def create_database(self):
        """创建数据库（不存在则创建）"""
        conn = self.connect_without_db()
        if not conn:
            return False
        try:
            with conn.cursor() as cursor:
                cursor.execute(f"CREATE DATABASE IF NOT EXISTS `{self.db_name}` CHARACTER SET utf8mb4;")
            conn.commit()
            print(f"[DB] 数据库 {self.db_name} 创建/验证成功")
            return True
        except Exception as e:
            print(f"[DB] 创建数据库失败：{str(e)}")
            return False
        finally:
            if conn:
                conn.close()

    def connect(self):
        """连接到指定数据库"""
        try:
            self.config['db'] = self.db_name
            self.connection = pymysql.connect(**self.config)
            print(f"[DB] 已连接到 {self.db_name}")
            return True
        except Exception as e:
            print(f"[DB] 数据库连接失败：{str(e)}")
            self.connection = None
            return False

    def create_all_tables(self):
        """创建四张结构一致的分时段表"""
        if not self.connection:
            print(f"[DB] 未连接数据库，无法创建表")
            return False

        # 表结构模板（所有表共用）
        table_sql = """
        CREATE TABLE IF NOT EXISTS `{table_name}` (
            `id` INT AUTO_INCREMENT PRIMARY KEY COMMENT '主键',
            `stock_code` VARCHAR(20) NOT NULL COMMENT '股票代码',
            `stock_name` VARCHAR(50) NOT NULL COMMENT '股票名称',
            `opening_price` DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '开盘价',
            `previous_close` DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '昨日收盘价',
            `current_price` DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '当前价',
            `highest_price` DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '最高价',
            `lowest_price` DECIMAL(10,2) NOT NULL DEFAULT 0.00 COMMENT '最低价',
            `collect_time` DATETIME NOT NULL COMMENT '采集时间',
            `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
            -- 索引优化查询速度
            INDEX `idx_code` (`stock_code`),
            INDEX `idx_time` (`collect_time`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='{comment}';
        """

        # 每张表的注释
        table_comments = {
            "stock_seconds": "股票每秒数据表",
            "stock_minutes": "股票每分钟数据表",
            "stock_hours": "股票每小时数据表",
            "stock_days": "股票每天数据表"
        }

        try:
            with self.connection.cursor() as cursor:
                for table_name, comment in table_comments.items():
                    cursor.execute(table_sql.format(table_name=table_name, comment=comment))
            self.connection.commit()
            print(f"[DB] 四张分时段表创建/验证成功")
            return True
        except Exception as e:
            self.connection.rollback()
            print(f"[DB] 创建表失败：{str(e)}")
            return False

    def init_all_tables_with_same_data(self):
        """用同一批新浪数据初始化四张表（核心：保证初始数据一致）"""
        if not self.connection:
            print(f"[DB] 未连接数据库，无法初始化数据")
            return False

        # 1. 获取新浪初始化数据
        init_data = get_sina_init_data()
        if not init_data:
            print(f"[DB] 无有效初始化数据，初始化失败")
            return False

        # 2. 向四张表批量插入同一批数据
        try:
            with self.connection.cursor() as cursor:
                for table_type, table_name in self.table_map.items():
                    # 插入SQL（所有表字段一致）
                    insert_sql = f"""
                    INSERT INTO `{table_name}` (
                        stock_code, stock_name, opening_price, previous_close,
                        current_price, highest_price, lowest_price, collect_time
                    ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
                    """
                    # 准备数据
                    data_list = [
                        (
                            item["stock_code"], item["stock_name"], item["opening_price"],
                            item["previous_close"], item["current_price"], item["highest_price"],
                            item["lowest_price"], item["collect_time"]
                        ) for item in init_data
                    ]
                    # 批量插入
                    cursor.executemany(insert_sql, data_list)
            self.connection.commit()
            print(f"[DB] 已用同一批数据初始化四张表（共 {len(init_data)} 条股票数据）")
            return True
        except Exception as e:
            self.connection.rollback()
            print(f"[DB] 初始化表数据失败：{str(e)}")
            return False

    def query_paginated_data(self, table_type, page=1, page_size=10):
        """
        分页查询指定表数据（核心功能）
        :param table_type: 表类型（seconds/minutes/hours/days）
        :param page: 页码（默认1）
        :param page_size: 每页条数（默认10，最大50）
        :return: 标准分页响应
        """
        # 1. 基础参数校验
        if not self.connection:
            return self._resp(500, "数据库未连接")
        if table_type not in self.table_map:
            return self._resp(400, f"无效table_type，仅支持：{list(self.table_map.keys())}")

        # 2. 修正分页参数（避免异常值）
        page = max(int(page), 1)  # 页码最小为1
        page_size = max(min(int(page_size), 50), 1)  # 每页1-50条
        offset = (page - 1) * page_size
        table_name = self.table_map[table_type]

        try:
            with self.connection.cursor() as cursor:
                # 3. 查询总条数（计算总页数）
                cursor.execute(f"SELECT COUNT(*) AS total FROM `{table_name}`;")
                total_count = cursor.fetchone()["total"]

                # 4. 查询当前页数据（按采集时间倒序，最新在前）
                query_sql = f"""
                SELECT 
                    stock_code, stock_name, opening_price, previous_close,
                    current_price, highest_price, lowest_price, collect_time
                FROM `{table_name}`
                ORDER BY collect_time DESC
                LIMIT %s OFFSET %s;
                """
                cursor.execute(query_sql, (page_size, offset))
                data_list = cursor.fetchall()

                # 5. 计算总页数
                total_page = (total_count + page_size - 1) // page_size

                # 6. 格式化响应（含分页信息和表格数据）
                return self._resp(
                    code=200,
                    msg="查询成功",
                    data={
                        "pagination": {  # 分页信息
                            "total_count": total_count,  # 总条数
                            "total_page": total_page,  # 总页数
                            "current_page": page,  # 当前页
                            "page_size": page_size  # 每页条数
                        },
                        "table_data": treat_data(data_list)  # 表格格式数据
                    }
                )
        except Exception as e:
            print(f"[DB] 分页查询失败：{str(e)}")
            return self._resp(500, f"查询异常：{str(e)}")

    def _resp(self, code, msg, data=None):
        """统一响应格式（方便前端处理）"""
        return {
            "code": code,  # 状态码：200成功，400参数错，500服务器错
            "msg": msg,  # 提示信息
            "data": data or {}  # 业务数据
        }

    def close(self):
        """关闭数据库连接"""
        if self.connection:
            self.connection.close()
            self.connection = None
            print(f"[DB] 连接已关闭")


# -------------------------- 3. FastAPI接口（单接口+参数查询） --------------------------
router = APIRouter()

# 初始化数据库（服务启动时执行）
db = StockDatabase()


@router.on_event("startup")
def startup():
    """服务启动：创建数据库→连接→创建表→初始化数据"""
    if db.create_database():
        if db.connect():
            db.create_all_tables()
            db.init_all_tables_with_same_data()  # 用同数据初始化四张表
        else:
            print(f"[服务启动失败] 数据库连接失败")
    else:
        print(f"[服务启动失败] 数据库创建失败")


# 关闭数据库（服务停止时执行）
@router.on_event("shutdown")
def shutdown():
    db.close()


# 核心接口：单接口+多参数查询
@router.get("/api/stock/query", summary="股票数据分页查询")
def query_stock(
        table_type: str = Query(...,
                                description="表类型：seconds（每秒表）、minutes（每分钟表）、hours（每小时表）、days（每天表）"),
        page: int = Query(1, description="页码，默认1"),
        page_size: int = Query(10, description="每页条数，默认10，最大50")
):
    """
    示例调用：
    - 查询每秒表第1页，每页5条：/api/stock/query?table_type=seconds&page=1&page_size=5
    - 查询每天表第2页，每页20条：/api/stock/query?table_type=days&page=2&page_size=20
    """
    return db.query_paginated_data(table_type, page, page_size)


# -------------------------- 4. 启动服务 --------------------------
if __name__ == "__main__":
    # 启动UVicorn服务（支持外部访问）
    uvicorn.run(
        app="新数据库查询:app",  # 若文件名不是main.py，需改为“文件名:app”（如“stock_api:app”）
        host="0.0.0.0",  # 允许所有IP访问
        port=8080,  # 端口（可修改）
        reload=True  # 开发模式自动重载（生产环境关闭）
    )