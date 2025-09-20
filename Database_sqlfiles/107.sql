USE mindmap;

-- 插入金融数据分析与Python应用课程的学习单元数据（从32开始）
INSERT INTO units (unit_id, name, course_id) VALUES
(32, 'Python金融编程基础', 107),
(33, '金融数据获取与处理', 107),
(34, '量化投资分析', 107),
(35, '风险管理模型构建', 107),
(36, '金融科技应用实战', 107);

-- 插入知识点数据（只调整unit_id关联）
INSERT INTO knowledge_points (point_id, unit_id, description, difficulty) VALUES
(140, 32, 'Python基础语法与数据结构', '中'),
(141, 32, 'NumPy数值计算与数组操作', '中'),
(142, 32, 'Pandas数据分析库应用', '高'),
(143, 32, 'Matplotlib金融数据可视化', '中'),
(144, 33, '金融API接口调用与数据获取', '高'),
(145, 33, '金融时间序列数据处理', '高'),
(146, 33, '数据清洗与异常值处理', '高'),
(147, 33, '大数据存储与管理技术', '高'),
(148, 34, '量化投资策略基础', '高'),
(149, 34, '技术指标计算与应用', '高'),
(150, 34, '投资组合优化模型', '高'),
(151, 34, '回测系统构建与评估', '高'),
(152, 35, '市场风险度量模型', '高'),
(153, 35, '信用风险评估方法', '高'),
(154, 35, 'VaR风险价值计算', '高'),
(155, 35, '压力测试与情景分析', '高'),
(156, 36, '机器学习在金融中的应用', '高'),
(157, 36, '区块链金融应用实践', '高'),
(158, 36, '智能投顾系统开发', '高'),
(159, 36, '金融大数据分析案例', '高');

-- 插入能力项数据（不需要调整，因为point_id保持不变）
INSERT INTO capabilities (capability_id, name, category, subcategory, point_id) VALUES
(140, 'Python编程', '技术能力', '编程技能', 140),
(141, '数值计算', '技术能力', '数据处理', 141),
(142, '数据分析', '技术能力', '数据处理', 142),
(143, '数据可视化', '技术能力', '数据展示', 143),
(144, 'API调用', '技术能力', '数据获取', 144),
(145, '时间序列分析', '分析能力', '数据分析', 145),
(146, '数据清洗', '技术能力', '数据处理', 146),
(147, '数据管理', '技术能力', '数据存储', 147),
(148, '量化策略', '应用能力', '投资分析', 148),
(149, '指标计算', '技术能力', '量化分析', 149),
(150, '组合优化', '分析能力', '投资分析', 150),
(151, '回测开发', '技术能力', '系统构建', 151),
(152, '风险度量', '分析能力', '风险评估', 152),
(153, '信用评估', '分析能力', '风险评估', 153),
(154, 'VaR计算', '技术能力', '风险量化', 154),
(155, '压力测试', '分析能力', '风险分析', 155),
(156, '机器学习应用', '技术能力', '智能分析', 156),
(157, '区块链应用', '技术能力', '金融科技', 157),
(158, '投顾开发', '技术能力', '系统开发', 158),
(159, '大数据分析', '分析能力', '数据分析', 159);

-- 插入学习资源数据（不需要调整，因为capability_id保持不变）
INSERT INTO resources (resource_id, capability_id, name, type, url) VALUES
(140, 140, 'Python金融编程基础教程', 'markdown', '/resources/python_finance_basics.md'),
(141, 141, 'NumPy金融计算指南', 'markdown', '/resources/numpy_financial_calculations.md'),
(142, 142, 'Pandas金融数据分析', 'markdown', '/resources/pandas_financial_analysis.md'),
(143, 143, '金融数据可视化技术', 'markdown', '/resources/financial_data_visualization.md'),
(144, 144, '金融API接口调用实战', 'markdown', '/resources/financial_api_integration.md'),
(145, 145, '金融时间序列处理', 'markdown', '/resources/financial_time_series.md'),
(146, 146, '金融数据清洗与预处理', 'markdown', '/resources/financial_data_cleaning.md'),
(147, 147, '金融大数据存储管理', 'markdown', '/resources/financial_bigdata_management.md'),
(148, 148, '量化投资策略开发', 'markdown', '/resources/quantitative_strategies.md'),
(149, 149, '技术指标计算与应用', 'markdown', '/resources/technical_indicators.md'),
(150, 150, '投资组合优化模型', 'markdown', '/resources/portfolio_optimization.md'),
(151, 151, '回测系统构建指南', 'markdown', '/resources/backtesting_systems.md'),
(152, 152, '市场风险度量方法', 'markdown', '/resources/market_risk_measurement.md'),
(153, 153, '信用风险评估模型', 'markdown', '/resources/credit_risk_assessment.md'),
(154, 154, 'VaR计算方法与实践', 'markdown', '/resources/var_calculation.md'),
(155, 155, '金融压力测试技术', 'markdown', '/resources/financial_stress_testing.md'),
(156, 156, '机器学习金融应用', 'markdown', '/resources/ml_in_finance.md'),
(157, 157, '区块链金融实践', 'markdown', '/resources/blockchain_finance.md'),
(158, 158, '智能投顾系统开发', 'markdown', '/resources/robo_advisor_development.md'),
(159, 159, '金融大数据分析案例', 'markdown', '/resources/financial_bigdata_cases.md');