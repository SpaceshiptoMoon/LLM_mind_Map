USE mindmap;

-- 插入《金融思维与职业素养》课程的学习单元数据（从27开始）
INSERT INTO units (unit_id, name, course_id) VALUES
(27, '金融伦理与职业道德', 106),
(28, '金融思维与决策框架', 106),
(29, '行为金融与投资者教育', 106),
(30, '金融法律法规与合规', 106),
(31, '职业规划与沟通表达', 106);

-- 插入知识点数据（只调整unit_id关联）
INSERT INTO knowledge_points (point_id, unit_id, description, difficulty) VALUES
(120, 27, '金融伦理的基本原则与范畴', '中'),
(121, 27, '职业道德与金融行业规范', '中'),
(122, 27, '利益冲突与内幕交易防范', '高'),
(123, 27, '社会责任与可持续金融', '中'),
(124, 28, '系统性思维与金融整体观', '高'),
(125, 28, '风险收益权衡与决策心理', '高'),
(126, 28, '金融创新与守正平衡', '高'),
(127, 28, '批判性思维与信息甄别', '中'),
(128, 29, '行为金融学基础与常见偏差', '中'),
(129, 29, '投资者行为分析与引导', '高'),
(130, 29, '金融消费者权益保护', '中'),
(131, 29, '金融普及教育与素养提升', '中'),
(132, 30, '金融监管体系与核心法规', '中'),
(133, 30, '合规管理与实践', '高'),
(134, 30, '金融犯罪与法律责任', '高'),
(135, 30, '跨境金融监管与国际合作', '高'),
(136, 31, '金融职业路径与能力模型', '低'),
(137, 31, '团队协作与项目管理', '中'),
(138, 31, '金融写作与报告呈现', '中'),
(139, 31, '专业演讲与客户沟通', '中');

-- 插入能力项数据（不需要调整，因为point_id保持不变）
INSERT INTO capabilities (capability_id, name, category, subcategory, point_id) VALUES
(120, '伦理原则应用', '职业素养', '伦理决策', 120),
(121, '规范遵循', '职业素养', '合规意识', 121),
(122, '利益冲突处理', '职业素养', '伦理决策', 122),
(123, '社会责任践行', '职业素养', '社会责任', 123),
(124, '系统思维', '综合能力', '思维模式', 124),
(125, '风险收益决策', '综合能力', '决策能力', 125),
(126, '创新守正平衡', '综合能力', '创新管理', 126),
(127, '信息甄别', '综合能力', '批判思维', 127),
(128, '行为偏差识别', '专业能力', '行为分析', 128),
(129, '投资者引导', '专业能力', '客户服务', 129),
(130, '消费者权益保护', '职业素养', '社会责任', 130),
(131, '金融知识普及', '综合能力', '教育传播', 131),
(132, '法规理解', '专业能力', '合规意识', 132),
(133, '合规实践', '专业能力', '合规管理', 133),
(134, '法律风险防控', '专业能力', '风险管理', 134),
(135, '国际监管协调', '专业能力', '国际视野', 135),
(136, '职业规划', '综合能力', '自我管理', 136),
(137, '团队合作', '综合能力', '沟通协作', 137),
(138, '金融写作', '综合能力', '沟通协作', 138),
(139, '专业沟通', '综合能力', '沟通协作', 139);

-- 插入学习资源数据（不需要调整，因为capability_id保持不变）
INSERT INTO resources (resource_id, capability_id, name, type, url) VALUES
(120, 120, '金融伦理基本原则', 'markdown', '/resources/financial_ethics_basics.md'),
(121, 121, '金融行业职业道德规范', 'markdown', '/resources/professional_ethics_norms.md'),
(122, 122, '利益冲突防范指南', 'markdown', '/resources/conflict_of_interest_prevention.md'),
(123, 123, '社会责任与可持续金融', 'markdown', '/resources/social_responsibility_sustainable_finance.md'),
(124, 124, '金融系统性思维', 'markdown', '/resources/financial_systemic_thinking.md'),
(125, 125, '风险收益权衡决策', 'markdown', '/resources/risk_return_decision_making.md'),
(126, 126, '金融创新的边界与平衡', 'markdown', '/resources/financial_innovation_balance.md'),
(127, 127, '金融信息甄别与批判性思维', 'markdown', '/resources/information_screening_critical_thinking.md'),
(128, 128, '行为金融常见偏差', 'markdown', '/resources/behavioral_finance_biases.md'),
(129, 129, '投资者行为分析与引导方法', 'markdown', '/resources/investor_behavior_guidance.md'),
(130, 130, '金融消费者权益保护体系', 'markdown', '/resources/financial_consumer_protection.md'),
(131, 131, '金融知识普及策略与技巧', 'markdown', '/resources/financial_literacy_popularization.md'),
(132, 132,  '金融监管核心法规解读', 'markdown', '/resources/financial_regulations_core.md'),
(133, 133, '合规管理实践操作', 'markdown', '/resources/compliance_management_practices.md'),
(134, 134, '金融犯罪类型与法律责任', 'markdown', '/resources/financial_crimes_liabilities.md'),
(135, 135, '跨境金融监管合作', 'markdown', '/resources/cross_border_regulatory_cooperation.md'),
(136, 136, '金融职业发展路径规划', 'markdown', '/resources/financial_career_path_planning.md'),
(137, 137, '金融团队协作与项目管理', 'markdown', '/resources/financial_teamwork_project_management.md'),
(138, 138, '金融写作与报告撰写技巧', 'markdown', '/resources/financial_writing_reporting_skills.md'),
(139, 139, '金融专业演讲与客户沟通', 'markdown', '/resources/financial_presentation_client_communication.md');