USE mindmap;

-- 1. 创建units表（学习单元）
CREATE TABLE units (
    unit_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    name VARCHAR(100) NOT NULL,
    course_id INT NOT NULL
);

-- 2. 创建knowledge_points表（知识点）
CREATE TABLE knowledge_points (
    point_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    unit_id INT NOT NULL,
    description TEXT NOT NULL,
    difficulty VARCHAR(20) NOT NULL,
    FOREIGN KEY (unit_id) REFERENCES units(unit_id)
);

-- 3. 创建capabilities表（能力项）
CREATE TABLE capabilities (
    capability_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    subcategory VARCHAR(50) NOT NULL,
    point_id INT NOT NULL,
    FOREIGN KEY (point_id) REFERENCES knowledge_points(point_id)
);

-- 4. 创建resources表（学习资源）
CREATE TABLE resources (
    resource_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    capability_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(20) NOT NULL DEFAULT 'markdown',
    url VARCHAR(768) NOT NULL UNIQUE,
    FOREIGN KEY (capability_id) REFERENCES capabilities(capability_id)
);