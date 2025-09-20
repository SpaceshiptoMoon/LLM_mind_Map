from fastapi import  APIRouter, Query  # 用Query定义查询参数，支持校验
from fastapi.middleware.cors import CORSMiddleware
import uvicorn, requests, re, asyncio, random, string
import pymysql, json
from pymysql.cursors import DictCursor


# -------------------------- 1. 工具函数（不变） --------------------------
def extract_multi_stock_info(raw_multi_data):
    stock_pattern = re.compile(r'var hq_str_([a-z0-9]+)="(.*?)";', re.IGNORECASE)
    stock_matches = stock_pattern.findall(raw_multi_data)
    if not stock_matches:
        print(f"未匹配到股票数据！原始响应前500字符：{raw_multi_data[:500]}")
        return []

    key_fields = [
        ("stock_code", None, str),
        ("stock_name", 0, str),
        ("opening_price", 1, float),
        ("previous_close", 2, float),
        ("current_price", 3, float),
        ("highest_price", 4, float),
        ("lowest_price", 5, float)
    ]

    all_stock_info = []
    for stock_code, data_str in stock_matches:
        data_list = data_str.split(",")
        stock_info = {}
        for field_name, idx, dtype in key_fields:
            if field_name == "stock_code":
                stock_info[field_name] = stock_code
            else:
                try:
                    raw_val = data_list[idx].strip() if idx < len(data_list) else ""
                    stock_info[field_name] = dtype(raw_val) if raw_val else 0.0
                except (IndexError, ValueError):
                    stock_info[field_name] = 0.0
                    print(f"解析{field_name}失败（股票{stock_code}）：设为默认值0.0")
        all_stock_info.append(stock_info)
    return all_stock_info


def treat_data(data_list):
    datas = {"data": [], "columns": []}
    columns_map = [
        ("股票代码", "stock_code"),
        ("股票名称", "stock_name"),
        ("今日开盘价", "opening_price"),
        ("昨日收盘价", "previous_close"),
        ("当前价", "current_price"),
        ("最高价", "highest_price"),
        ("最低价", "lowest_price")
    ]
    for title, dataIndex in columns_map:
        datas["columns"].append({"title": title, "dataIndex": dataIndex})
    datas["data"] = data_list if data_list else []
    return datas


# -------------------------- 2. 数据库操作类（不变） --------------------------
class StockDatabase:
    def __init__(self, db_name='stock_db'):
        self.config = {
            'host': '120.78.220.29',
            'user': 'root',
            'password': 'dE2`eD8>oK3)',
            'port': 3308,
            'charset': 'utf8mb4',
            'cursorclass': DictCursor,
            'connect_timeout': 10
        }
        self.db_name = db_name
        self.connection = None

    def connect_without_db(self):
        try:
            config = self.config.copy()
            config.pop('db', None)
            conn = pymysql.connect(**config)
            print("未指定数据库的连接成功")
            return conn
        except Exception as e:
            print(f"未指定数据库连接失败: {str(e)}")
            return None

    def create_database(self):
        conn = self.connect_without_db()
        if not conn:
            return False
        try:
            with conn.cursor() as cursor:
                cursor.execute(f"CREATE DATABASE IF NOT EXISTS {self.db_name} CHARACTER SET utf8mb4;")
            conn.commit()
            print(f"数据库 {self.db_name} 就绪")
            return True
        except Exception as e:
            print(f"创建数据库失败: {str(e)}")
            return False
        finally:
            conn.close() if conn else None

    def get_stocks_by_price_range(self):
        if not self.connection:
            print("数据库未连接，查询失败")
            return []
        try:
            with self.connection.cursor() as cursor:
                sql = """
                SELECT 
                    stock_code, stock_name,
                    CAST(opening_price AS FLOAT) AS opening_price,
                    CAST(previous_close AS FLOAT) AS previous_close,
                    CAST(current_price AS FLOAT) AS current_price,
                    CAST(highest_price AS FLOAT) AS highest_price,
                    CAST(lowest_price AS FLOAT) AS lowest_price
                FROM stocks ORDER BY stock_code
                """
                cursor.execute(sql)
                results = cursor.fetchall()
                print(f"数据库查询到 {len(results)} 条数据")
                return results
        except Exception as e:
            print(f"数据库查询错误: {str(e)}")
            return []

    def connect(self):
        try:
            self.config['db'] = self.db_name
            self.connection = pymysql.connect(**self.config)
            print(f"数据库 {self.db_name} 连接成功")
            return True
        except Exception as e:
            print(f"数据库连接失败: {str(e)}")
            return False

    def create_table(self):
        if not self.connection:
            print("未连接数据库，无法创建表")
            return False
        try:
            with self.connection.cursor() as cursor:
                sql = """
                CREATE TABLE IF NOT EXISTS stocks (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    stock_code VARCHAR(20) NOT NULL UNIQUE,
                    stock_name VARCHAR(50) NOT NULL,
                    opening_price DECIMAL(10,2) NOT NULL DEFAULT 0.00,
                    previous_close DECIMAL(10,2) NOT NULL DEFAULT 0.00,
                    current_price DECIMAL(10,2) NOT NULL DEFAULT 0.00,
                    highest_price DECIMAL(10,2) NOT NULL DEFAULT 0.00,
                    lowest_price DECIMAL(10,2) NOT NULL DEFAULT 0.00,
                    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
                ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
                """
                cursor.execute(sql)
            self.connection.commit()
            print("股票表就绪")
            return True
        except Exception as e:
            self.connection.rollback()
            print(f"创建表失败: {str(e)}")
            return False

    def batch_insert_stock_data(self, stock_data_list):
        if not self.connection or not stock_data_list:
            print("数据库未连接或无数据，插入失败")
            return False
        try:
            with self.connection.cursor() as cursor:
                sql = """
                INSERT INTO stocks (stock_code, stock_name, opening_price, previous_close, 
                                    current_price, highest_price, lowest_price)
                VALUES (%s, %s, %s, %s, %s, %s, %s)
                ON DUPLICATE KEY UPDATE 
                    stock_name=%s, opening_price=%s, previous_close=%s,
                    current_price=%s, highest_price=%s, lowest_price=%s
                """
                data = []
                for item in stock_data_list:
                    data.append((
                        item['stock_code'], item['stock_name'], item['opening_price'],
                        item['previous_close'], item['current_price'], item['highest_price'],
                        item['lowest_price'],
                        item['stock_name'], item['opening_price'], item['previous_close'],
                        item['current_price'], item['highest_price'], item['lowest_price']
                    ))
                cursor.executemany(sql, data)
            self.connection.commit()
            print(f"批量处理 {len(stock_data_list)} 条数据完成")
            return True
        except Exception as e:
            self.connection.rollback()
            print(f"批量插入失败: {str(e)}")
            return False

    def close(self):
        if self.connection:
            self.connection.close()
            self.connection = None
            print("数据库连接已关闭")


# -------------------------- 3. 新浪接口配置（不变） --------------------------
HEADERS = {
    "Accept": "*/*",
    "Accept-Language": "zh-CN,zh;q=0.9",
    "Cache-Control": "no-cache",
    "Connection": "keep-alive",
    "Pragma": "no-cache",
    "Referer": "https://vip.stock.finance.sina.com.cn/",
    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
    "sec-ch-ua": "\"Chromium\";v=\"120\", \"Not=A?Brand\";v=\"24\", \"Google Chrome\";v=\"120\"",
    "sec-ch-ua-mobile": "?0",
    "sec-ch-ua-platform": "\"Windows\""
}


def get_sina_url():
    stock_list = "bj832000,bj872351,sz300959,sh688766,sz300043,sz300013,sz300007,sh688047,sz300727,sz301307,sz300684,sh688648,sz300449,sz301201,sz300952,sz301016,sz300885,sh600162,sz000564,sz300918,sh600376,sh603959,sz000559,sz002067,sh600684,sh605136,sz301488,sh603829,sz002183,sz002347,sh600629,sh603286,sh605298,sh603655,sz002126,sh603215,sh603920,sz002718,sh603516,sh603626"
    rn = ''.join(random.choices(string.ascii_lowercase + string.digits, k=6))
    return f"https://hq.sinajs.cn/rn={rn}&list={stock_list}"


# -------------------------- 4. FastAPI实例与【单接口】 --------------------------
router  =  APIRouter()

# # 跨域配置（不变）
# router.add_middleware(
#     CORSMiddleware,
#     allow_origins=["*"],
#     allow_credentials=True,
#     allow_methods=["GET"],
#     allow_headers=["*"],
# )

# 时间类型映射（不变，仅用于内部逻辑匹配）
TIME_TYPE_CONFIG = {
    "seconds": (1, False),
    "minutes": (60, False),
    "hours": (3600, False),
    "days": (86400, True)
}


# -------------------------- 5. 真正的单接口：用查询参数控制 --------------------------
@router.get(
    "/stock-data",  # 固定路径！不再变
    summary="股票数据单接口",
    description="通过time_type查询参数控制：seconds(1秒)/minutes(1分)/hours(1小时)/days(1天)"
)
async def get_stock_data(
        # 查询参数：必填，且只能取指定值，不符合会自动返回422错误
        time_type: str = Query(
            ...,  # ...表示必填
            enum=list(TIME_TYPE_CONFIG.keys()),  # 限制参数值只能是列表中的4个
            description="时间类型：seconds（1秒）、minutes（1分）、hours（1小时）、days（1天）"
        )
):
    # 1. 根据查询参数获取配置（逻辑不变）
    wait_seconds, is_from_db = TIME_TYPE_CONFIG[time_type]

    # 2. 等待指定时长
    # print(f"开始等待 {wait_seconds} 秒...")
    # # await asyncio.sleep(wait_seconds)
    # print(f"等待结束，开始获取数据（来源：{'数据库' if is_from_db else '新浪接口'}）")

    # 3. 获取数据（逻辑不变）
    if is_from_db:
        db = StockDatabase()
        try:
            if db.create_database() and db.connect() and db.create_table():
                stock_data = db.get_stocks_by_price_range()
            else:
                stock_data = []
                print("数据库初始化失败，返回空数据")
        except Exception as e:
            stock_data = []
            print(f"数据库操作异常: {str(e)}")
        finally:
            db.close()
    else:
        try:
            response = requests.get(get_sina_url(), headers=HEADERS, timeout=10)
            response.encoding = "gbk"
            stock_data = extract_multi_stock_info(response.text)
        except requests.exceptions.RequestException as e:
            stock_data = []
            print(f"新浪接口请求失败: {str(e)}")

    # 4. 统一返回格式
    return treat_data(stock_data)


def connect():
    print("=== 服务启动前，初始化数据库并同步新浪数据 ===")
    init_db = StockDatabase()
    if init_db.create_database() and init_db.connect() and init_db.create_table():
        try:
            init_response = requests.get(get_sina_url(), headers=HEADERS, timeout=10)
            init_response.encoding = "gbk"
            init_data = extract_multi_stock_info(init_response.text)
            if init_data:
                init_db.batch_insert_stock_data(init_data)
            else:
                print("未获取到新浪初始数据，数据库为空")
        except Exception as e:
            print(f"初始化同步新浪数据失败: {str(e)}")
    init_db.close()

# -------------------------- 6. 服务启动（不变） --------------------------
if __name__ == '__main__':
    # 初始化数据库
    print("=== 服务启动前，初始化数据库并同步新浪数据 ===")
    init_db = StockDatabase()
    if init_db.create_database() and init_db.connect() and init_db.create_table():
        try:
            init_response = requests.get(get_sina_url(), headers=HEADERS, timeout=10)
            init_response.encoding = "gbk"
            init_data = extract_multi_stock_info(init_response.text)
            if init_data:
                init_db.batch_insert_stock_data(init_data)
            else:
                print("未获取到新浪初始数据，数据库为空")
        except Exception as e:
            print(f"初始化同步新浪数据失败: {str(e)}")
    init_db.close()

    # 启动服务（文件名需为"新浪财经单接口.py"，否则修改第一个参数）
    uvicorn.run(
        "新浪财经唯一接口:app",
        host="0.0.0.0",
        port=8080,
        reload=True,
        timeout_keep_alive=30
    )