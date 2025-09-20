USE mindmap;

-- 插入金融学课程的学习单元数据
INSERT INTO units (unit_id, name, course_id) VALUES
(11, '金融学基础', 103),
(12, '货币与信用', 103),
(13, '金融市场', 103),
(14, '金融机构', 103),
(15, '金融风险与管理', 103);

-- 插入金融学课程的知识点数据
INSERT INTO knowledge_points (point_id, unit_id, description, difficulty) VALUES
(39, 11, '金融学定义与发展', '低'),
(40, 11, '金融体系与金融功能', '中'),
(41, 11, '金融学基本概念与术语', '低'),
(42, 11, '金融与经济发展关系', '中'),
(43, 12, '货币职能与货币形式演进', '低'),
(44, 12, '信用形式与信用体系', '中'),
(45, 12, '利率决定理论与影响因素', '高'),
(46, 12, '货币时间价值', '中'),
(47, 13, '金融市场分类与功能', '中'),
(48, 13, '货币市场与资本市场', '高'),
(49, 13, '股票与债券市场运作', '高'),
(50, 13, '金融衍生品市场', '高'),
(51, 14, '商业银行职能与业务', '中'),
(52, 14, '投资银行与证券公司', '中'),
(53, 14, '保险公司与基金管理公司', '中'),
(54, 14, '中央银行与货币政策', '高'),
(55, 15, '金融风险类型与特征', '中'),
(56, 15, '风险管理基本框架', '高'),
(57, 15, '金融监管体系', '高'),
(58, 15, '金融危机与防范', '高');

-- 插入金融学课程的能力项数据
INSERT INTO capabilities (capability_id, name, category, subcategory, point_id) VALUES
(38, '金融概念理解', '理论基础', '知识掌握', 39),
(39, '体系分析', '分析能力', '系统分析', 40),
(40, '术语掌握', '理论基础', '知识掌握', 41),
(41, '经济关系分析', '分析能力', '关联分析', 42),
(42, '货币知识', '理论基础', '知识掌握', 43),
(43, '信用分析', '分析能力', '关系分析', 44),
(44, '利率分析', '分析能力', '定量分析', 45),
(45, '时间价值计算', '应用能力', '计算技巧', 46),
(46, '市场分类', '理论基础', '知识掌握', 47),
(47, '市场分析', '分析能力', '系统分析', 48),
(48, '证券分析', '分析能力', '投资分析', 49),
(49, '衍生品理解', '理论基础', '知识掌握', 50),
(50, '银行业务理解', '应用能力', '业务知识', 51),
(51, '投行知识', '应用能力', '业务知识', 52),
(52, '保险基金知识', '应用能力', '业务知识', 53),
(53, '政策分析', '分析能力', '政策分析', 54),
(54, '风险识别', '问题解决', '风险识别', 55),
(55, '风险管理', '问题解决', '风险控制', 56),
(56, '监管理解', '应用能力', '合规知识', 57),
(57, '危机分析', '分析能力', '系统分析', 58);

-- 插入金融学课程的学习资源数据（全部为markdown格式）
INSERT INTO resources (resource_id, capability_id, name, type, url) VALUES
(39, 38, '金融学导论', 'markdown', '/resources/finance_introduction.md'),
(40, 39, '金融体系解析', 'markdown', '/resources/financial_system_analysis.md'),
(41, 40, '金融术语词典', 'markdown', '/resources/financial_glossary.md'),
(42, 41, '金融与经济发展', 'markdown', '/resources/finance_economy_relation.md'),
(43, 42, '货币职能与演进', 'markdown', '/resources/money_functions_evolution.md'),
(44, 43, '信用形式与应用', 'markdown', '/resources/credit_forms_applications.md'),
(45, 44, '利率决定理论', 'markdown', '/resources/interest_rate_theories.md'),
(46, 45, '货币时间价值计算', 'markdown', '/resources/time_value_calculation.md'),
(47, 46, '金融市场分类', 'markdown', '/resources/financial_market_classification.md'),
(48, 47, '货币市场分析', 'markdown', '/resources/money_market_analysis.md'),
(49, 48, '股票债券市场指南', 'markdown', '/resources/stock_bond_markets.md'),
(50, 49, '金融衍生品基础', 'markdown', '/resources/derivatives_basics.md'),
(51, 50, '商业银行实务', 'markdown', '/resources/commercial_banking_practices.md'),
(52, 51, '投资银行业务', 'markdown', '/resources/investment_banking_operations.md'),
(53, 52, '保险与基金业务', 'markdown', '/resources/insurance_fund_operations.md'),
(54, 53, '货币政策分析', 'markdown', '/resources/monetary_policy_analysis.md'),
(55, 54, '金融风险识别', 'markdown', '/resources/financial_risk_identification.md'),
(56, 55, '风险管理框架', 'markdown', '/resources/risk_management_framework.md'),
(57, 56, '金融监管体系', 'markdown', '/resources/financial_regulation_system.md'),
(58, 57, '金融危机与防范', 'markdown', '/resources/financial_crises_prevention.md');