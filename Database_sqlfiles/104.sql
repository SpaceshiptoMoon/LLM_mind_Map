USE mindmap;

-- 插入证券投资学课程的学习单元数据
INSERT INTO units (unit_id, name, course_id) VALUES
(16, '证券投资基础概念', 104),
(17, '股票投资分析', 104),
(18, '债券与基金投资', 104),
(19, '投资组合理论', 104),
(20, '证券投资实务', 104);

-- 插入证券投资学课程的知识点数据
INSERT INTO knowledge_points (point_id, unit_id, description, difficulty) VALUES
(76, 16, '证券与证券市场基本概念', '低'),
(77, 16, '证券投资的功能与分类', '低'),
(78, 16, '证券市场参与主体', '中'),
(79, 16, '证券发行与交易机制', '中'),
(80, 17, '股票基本特征与类型', '中'),
(81, 17, '股票估值方法', '高'),
(82, 17, '股票基本面分析', '高'),
(83, 17, '股票技术分析', '高'),
(84, 18, '债券特性与类型', '中'),
(85, 18, '债券定价与收益率计算', '高'),
(86, 18, '投资基金分类与运作', '中'),
(87, 18, '基金业绩评价', '高'),
(88, 19, '投资组合理论发展', '中'),
(89, 19, '资产配置策略', '高'),
(90, 19, '风险管理技术', '高'),
(91, 19, '投资绩效评估', '高'),
(92, 20, '证券交易流程', '中'),
(93, 20, '投资策略制定', '高'),
(94, 20, '投资心理与行为金融', '中'),
(95, 20, '证券投资法律法规', '中');

-- 插入证券投资学课程的能力项数据
INSERT INTO capabilities (capability_id, name, category, subcategory, point_id) VALUES
(76, '证券市场理解', '理论基础', '知识掌握', 76),
(77, '投资功能分析', '分析能力', '系统分析', 77),
(78, '市场主体识别', '分析能力', '关系分析', 78),
(79, '交易机制掌握', '应用能力', '操作知识', 79),
(80, '股票特性理解', '理论基础', '知识掌握', 80),
(81, '估值技术应用', '分析能力', '定量分析', 81),
(82, '基本面分析能力', '分析能力', '财务分析', 82),
(83, '技术分析能力', '分析能力', '市场分析', 83),
(84, '债券知识掌握', '理论基础', '知识掌握', 84),
(85, '债券定价能力', '分析能力', '定量分析', 85),
(86, '基金运作理解', '应用能力', '产品知识', 86),
(87, '基金评价能力', '分析能力', '绩效评估', 87),
(88, '组合理论理解', '理论基础', '知识掌握', 88),
(89, '资产配置能力', '应用能力', '策略制定', 89),
(90, '风险管理能力', '问题解决', '风险控制', 90),
(91, '绩效评估能力', '分析能力', '绩效评估', 91),
(92, '交易操作能力', '应用能力', '操作技能', 92),
(93, '策略制定能力', '应用能力', '策略设计', 93),
(94, '投资心理理解', '分析能力', '行为分析', 94),
(95, '法律合规意识', '应用能力', '合规知识', 95);

-- 插入证券投资学课程的学习资源数据（全部为markdown格式）
INSERT INTO resources (resource_id, capability_id, name, type, url) VALUES
(76, 76, '证券市场基础概念', 'markdown', '/resources/security_market_basics.md'),
(77, 77, '证券投资功能与分类', 'markdown', '/resources/investment_functions_classification.md'),
(78, 78, '证券市场参与主体详解', 'markdown', '/resources/market_participants.md'),
(79, 79, '证券发行与交易机制', 'markdown', '/resources/issuing_trading_mechanism.md'),
(80, 80, '股票特性与类型', 'markdown', '/resources/stock_characteristics_types.md'),
(81, 81, '股票估值方法详解', 'markdown', '/resources/stock_valuation_methods.md'),
(82, 82, '股票基本面分析指南', 'markdown', '/resources/fundamental_analysis_guide.md'),
(83, 83, '股票技术分析教程', 'markdown', '/resources/technical_analysis_tutorial.md'),
(84, 84, '债券特性与类型介绍', 'markdown', '/resources/bond_characteristics_types.md'),
(85, 85, '债券定价与收益率计算', 'markdown', '/resources/bond_pricing_yield.md'),
(86, 86, '投资基金分类与运作', 'markdown', '/resources/fund_classification_operations.md'),
(87, 87, '基金业绩评价方法', 'markdown', '/resources/fund_performance_evaluation.md'),
(88, 88, '投资组合理论发展', 'markdown', '/resources/portfolio_theory_development.md'),
(89, 89, '资产配置策略指南', 'markdown', '/resources/asset_allocation_strategies.md'),
(90, 90, '风险管理技术手册', 'markdown', '/resources/risk_management_techniques.md'),
(91, 91, '投资绩效评估方法', 'markdown', '/resources/investment_performance_evaluation.md'),
(92, 92, '证券交易流程详解', 'markdown', '/resources/securities_trading_process.md'),
(93, 93, '投资策略制定指南', 'markdown', '/resources/investment_strategy_development.md'),
(94, 94, '投资心理与行为金融', 'markdown', '/resources/investment_psychology_behavioral.md'),
(95, 95, '证券投资法律法规', 'markdown', '/resources/securities_laws_regulations.md');