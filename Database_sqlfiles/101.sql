
USE mindmap;
-- 创建计量经济学课程数据库
CREATE DATABASE IF NOT EXISTS mindmap;


-- 插入学习单元数据
INSERT INTO units (unit_id, name, course_id) VALUES
(1, '计量经济学基础', 101),
(2, '一元线性回归模型', 101),
(3, '多元线性回归模型', 101),
(4, '回归问题拓展', 101),
(5, '时间序列分析', 101);

-- 插入知识点数据
INSERT INTO knowledge_points (point_id, unit_id, description, difficulty) VALUES
(1, 1, '计量经济学定义、发展与意义', '低'),
(2, 1, '数据类型与变量分类', '低'),
(3, 1, '描述性统计分析', '低'),
(4, 1, '概率论与数理统计基础', '中'),
(5, 2, '一元线性回归模型设定', '中'),
(6, 2, '普通最小二乘法(OLS)估计', '中'),
(7, 2, '模型拟合优度与假设检验', '中'),
(8, 2, '模型预测与置信区间', '中'),
(9, 3, '多元线性回归模型设定', '中'),
(10, 3, '多重共线性问题', '高'),
(11, 3, '异方差性问题', '高'),
(12, 3, '模型设定误差', '高'),
(13, 4, '虚拟变量回归', '中'),
(14, 4, '逻辑回归模型', '高'),
(15, 4, '非线性回归模型', '高'),
(16, 5, '时间序列基本概念', '中'),
(17, 5, '平稳性检验', '高'),
(18, 5, '协整与误差修正模型', '高');

-- 插入能力项数据
INSERT INTO capabilities (capability_id, name, category, subcategory, point_id) VALUES
(1, '概念理解', '理论基础', '知识掌握', 1),
(2, '数据处理', '数据技能', '数据准备', 2),
(3, '统计描述', '数据技能', '数据分析', 3),
(4, '统计推断', '理论基础', '方法应用', 4),
(5, '模型设定', '建模能力', '模型构建', 5),
(6, '参数估计', '建模能力', '模型估计', 6),
(7, '模型检验', '建模能力', '模型验证', 7),
(8, '模型预测', '应用能力', '预测分析', 8),
(9, '多元建模', '建模能力', '模型构建', 9),
(10, '共线性诊断', '问题解决', '诊断修复', 10),
(11, '异方差处理', '问题解决', '诊断修复', 11),
(12, '模型诊断', '问题解决', '诊断修复', 12),
(13, '虚拟变量应用', '应用能力', '特殊技巧', 13),
(14, '非线性建模', '建模能力', '模型构建', 15),
(15, '序列分析', '建模能力', '模型构建', 16),
(16, '平稳性分析', '问题解决', '诊断修复', 17),
(17, '协整分析', '应用能力', '高级技巧', 18);

-- 插入学习资源数据（全部为markdown格式）
INSERT INTO resources (resource_id, capability_id, name, type, url) VALUES
(1, 1, '计量经济学导论', 'markdown', '/resources/intro_to_econometrics.md'),
(2, 1, '计量经济学发展简史', 'markdown', '/resources/history_of_econometrics.md'),
(3, 2, '数据清洗与整理指南', 'markdown', '/resources/data_cleaning_guide.md'),
(4, 3, '描述性统计分析案例', 'markdown', '/resources/descriptive_stats_case.md'),
(5, 4, '统计推断基础教程', 'markdown', '/resources/statistical_inference_tutorial.md'),
(6, 5, '线性回归模型设定', 'markdown', '/resources/linear_regression_specification.md'),
(7, 6, 'OLS估计原理详解', 'markdown', '/resources/ols_estimation_details.md'),
(8, 7, '假设检验方法', 'markdown', '/resources/hypothesis_testing_methods.md'),
(9, 8, '预测分析技术', 'markdown', '/resources/prediction_techniques.md'),
(10, 9, '多元回归模型构建', 'markdown', '/resources/multiple_regression_guide.md'),
(11, 10, '多重共线性检测与处理', 'markdown', '/resources/multicollinearity_handling.md'),
(12, 11, '异方差性检验方法', 'markdown', '/resources/heteroscedasticity_testing.md'),
(13, 12, '模型诊断技术', 'markdown', '/resources/model_diagnostic_techniques.md'),
(14, 13, '虚拟变量应用案例', 'markdown', '/resources/dummy_variables_applications.md'),
(15, 14, '非线性回归模型', 'markdown', '/resources/nonlinear_regression_models.md'),
(16, 15, '时间序列分析基础', 'markdown', '/resources/time_series_basics.md'),
(17, 16, '平稳性检验方法', 'markdown', '/resources/stationarity_testing.md'),
(18, 17, '协整分析实战', 'markdown', '/resources/cointegration_analysis.md');