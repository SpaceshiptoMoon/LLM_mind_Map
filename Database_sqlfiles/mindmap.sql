/*
 Navicat Premium Data Transfer

 Source Server         : 本地windows数据库
 Source Server Type    : MySQL
 Source Server Version : 80043
 Source Host           : localhost:3306
 Source Schema         : mindmap

 Target Server Type    : MySQL
 Target Server Version : 80043
 File Encoding         : 65001

 Date: 10/09/2025 09:15:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for capabilities
-- ----------------------------
DROP TABLE IF EXISTS `capabilities`;
CREATE TABLE `capabilities`  (
  `capability_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `subcategory` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `point_id` int NOT NULL,
  PRIMARY KEY (`capability_id`) USING BTREE,
  INDEX `point_id`(`point_id` ASC) USING BTREE,
  CONSTRAINT `capabilities_ibfk_1` FOREIGN KEY (`point_id`) REFERENCES `knowledge_points` (`point_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 160 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of capabilities
-- ----------------------------
INSERT INTO `capabilities` VALUES (1, '概念理解', '理论基础', '知识掌握', 1);
INSERT INTO `capabilities` VALUES (2, '数据处理', '数据技能', '数据准备', 2);
INSERT INTO `capabilities` VALUES (3, '统计描述', '数据技能', '数据分析', 3);
INSERT INTO `capabilities` VALUES (4, '统计推断', '理论基础', '方法应用', 4);
INSERT INTO `capabilities` VALUES (5, '模型设定', '建模能力', '模型构建', 5);
INSERT INTO `capabilities` VALUES (6, '参数估计', '建模能力', '模型估计', 6);
INSERT INTO `capabilities` VALUES (7, '模型检验', '建模能力', '模型验证', 7);
INSERT INTO `capabilities` VALUES (8, '模型预测', '应用能力', '预测分析', 8);
INSERT INTO `capabilities` VALUES (9, '多元建模', '建模能力', '模型构建', 9);
INSERT INTO `capabilities` VALUES (10, '共线性诊断', '问题解决', '诊断修复', 10);
INSERT INTO `capabilities` VALUES (11, '异方差处理', '问题解决', '诊断修复', 11);
INSERT INTO `capabilities` VALUES (12, '模型诊断', '问题解决', '诊断修复', 12);
INSERT INTO `capabilities` VALUES (13, '虚拟变量应用', '应用能力', '特殊技巧', 13);
INSERT INTO `capabilities` VALUES (14, '非线性建模', '建模能力', '模型构建', 15);
INSERT INTO `capabilities` VALUES (15, '序列分析', '建模能力', '模型构建', 16);
INSERT INTO `capabilities` VALUES (16, '平稳性分析', '问题解决', '诊断修复', 17);
INSERT INTO `capabilities` VALUES (17, '协整分析', '应用能力', '高级技巧', 18);
INSERT INTO `capabilities` VALUES (18, '序列特性识别', '理论基础', '知识掌握', 19);
INSERT INTO `capabilities` VALUES (19, '成分分解', '数据分析', '数据准备', 20);
INSERT INTO `capabilities` VALUES (20, '时序可视化', '数据技能', '数据展示', 21);
INSERT INTO `capabilities` VALUES (21, '相关性分析', '数据分析', '关系分析', 22);
INSERT INTO `capabilities` VALUES (22, 'MA模型构建', '建模能力', '模型构建', 23);
INSERT INTO `capabilities` VALUES (23, 'AR模型构建', '建模能力', '模型构建', 24);
INSERT INTO `capabilities` VALUES (24, 'ARMA模型应用', '建模能力', '模型估计', 25);
INSERT INTO `capabilities` VALUES (25, '模型识别', '问题解决', '诊断修复', 26);
INSERT INTO `capabilities` VALUES (26, '平稳性检验', '问题解决', '诊断修复', 27);
INSERT INTO `capabilities` VALUES (27, '差分处理', '数据技能', '数据转换', 28);
INSERT INTO `capabilities` VALUES (28, 'ARIMA建模', '建模能力', '模型构建', 29);
INSERT INTO `capabilities` VALUES (29, '季节调整', '问题解决', '诊断修复', 30);
INSERT INTO `capabilities` VALUES (30, 'VAR模型构建', '建模能力', '模型构建', 31);
INSERT INTO `capabilities` VALUES (31, '因果关系检验', '问题解决', '诊断修复', 32);
INSERT INTO `capabilities` VALUES (32, '脉冲响应分析', '应用能力', '高级技巧', 33);
INSERT INTO `capabilities` VALUES (33, '方差分解分析', '应用能力', '高级技巧', 34);
INSERT INTO `capabilities` VALUES (34, '预测技术', '应用能力', '预测分析', 35);
INSERT INTO `capabilities` VALUES (35, '预测评估', '应用能力', '模型验证', 36);
INSERT INTO `capabilities` VALUES (36, '金融应用', '应用能力', '领域应用', 37);
INSERT INTO `capabilities` VALUES (37, '经济应用', '应用能力', '领域应用', 38);
INSERT INTO `capabilities` VALUES (38, '金融概念理解', '理论基础', '知识掌握', 39);
INSERT INTO `capabilities` VALUES (39, '体系分析', '分析能力', '系统分析', 40);
INSERT INTO `capabilities` VALUES (40, '术语掌握', '理论基础', '知识掌握', 41);
INSERT INTO `capabilities` VALUES (41, '经济关系分析', '分析能力', '关联分析', 42);
INSERT INTO `capabilities` VALUES (42, '货币知识', '理论基础', '知识掌握', 43);
INSERT INTO `capabilities` VALUES (43, '信用分析', '分析能力', '关系分析', 44);
INSERT INTO `capabilities` VALUES (44, '利率分析', '分析能力', '定量分析', 45);
INSERT INTO `capabilities` VALUES (45, '时间价值计算', '应用能力', '计算技巧', 46);
INSERT INTO `capabilities` VALUES (46, '市场分类', '理论基础', '知识掌握', 47);
INSERT INTO `capabilities` VALUES (47, '市场分析', '分析能力', '系统分析', 48);
INSERT INTO `capabilities` VALUES (48, '证券分析', '分析能力', '投资分析', 49);
INSERT INTO `capabilities` VALUES (49, '衍生品理解', '理论基础', '知识掌握', 50);
INSERT INTO `capabilities` VALUES (50, '银行业务理解', '应用能力', '业务知识', 51);
INSERT INTO `capabilities` VALUES (51, '投行知识', '应用能力', '业务知识', 52);
INSERT INTO `capabilities` VALUES (52, '保险基金知识', '应用能力', '业务知识', 53);
INSERT INTO `capabilities` VALUES (53, '政策分析', '分析能力', '政策分析', 54);
INSERT INTO `capabilities` VALUES (54, '风险识别', '问题解决', '风险识别', 55);
INSERT INTO `capabilities` VALUES (55, '风险管理', '问题解决', '风险控制', 56);
INSERT INTO `capabilities` VALUES (56, '监管理解', '应用能力', '合规知识', 57);
INSERT INTO `capabilities` VALUES (57, '危机分析', '分析能力', '系统分析', 58);
INSERT INTO `capabilities` VALUES (76, '证券市场理解', '理论基础', '知识掌握', 76);
INSERT INTO `capabilities` VALUES (77, '投资功能分析', '分析能力', '系统分析', 77);
INSERT INTO `capabilities` VALUES (78, '市场主体识别', '分析能力', '关系分析', 78);
INSERT INTO `capabilities` VALUES (79, '交易机制掌握', '应用能力', '操作知识', 79);
INSERT INTO `capabilities` VALUES (80, '股票特性理解', '理论基础', '知识掌握', 80);
INSERT INTO `capabilities` VALUES (81, '估值技术应用', '分析能力', '定量分析', 81);
INSERT INTO `capabilities` VALUES (82, '基本面分析能力', '分析能力', '财务分析', 82);
INSERT INTO `capabilities` VALUES (83, '技术分析能力', '分析能力', '市场分析', 83);
INSERT INTO `capabilities` VALUES (84, '债券知识掌握', '理论基础', '知识掌握', 84);
INSERT INTO `capabilities` VALUES (85, '债券定价能力', '分析能力', '定量分析', 85);
INSERT INTO `capabilities` VALUES (86, '基金运作理解', '应用能力', '产品知识', 86);
INSERT INTO `capabilities` VALUES (87, '基金评价能力', '分析能力', '绩效评估', 87);
INSERT INTO `capabilities` VALUES (88, '组合理论理解', '理论基础', '知识掌握', 88);
INSERT INTO `capabilities` VALUES (89, '资产配置能力', '应用能力', '策略制定', 89);
INSERT INTO `capabilities` VALUES (90, '风险管理能力', '问题解决', '风险控制', 90);
INSERT INTO `capabilities` VALUES (91, '绩效评估能力', '分析能力', '绩效评估', 91);
INSERT INTO `capabilities` VALUES (92, '交易操作能力', '应用能力', '操作技能', 92);
INSERT INTO `capabilities` VALUES (93, '策略制定能力', '应用能力', '策略设计', 93);
INSERT INTO `capabilities` VALUES (94, '投资心理理解', '分析能力', '行为分析', 94);
INSERT INTO `capabilities` VALUES (95, '法律合规意识', '应用能力', '合规知识', 95);
INSERT INTO `capabilities` VALUES (96, '统计学概念理解', '理论基础', '知识掌握', 96);
INSERT INTO `capabilities` VALUES (97, '术语掌握', '理论基础', '知识掌握', 97);
INSERT INTO `capabilities` VALUES (98, '数据分类', '数据技能', '数据准备', 98);
INSERT INTO `capabilities` VALUES (99, '应用领域认知', '理论基础', '知识应用', 99);
INSERT INTO `capabilities` VALUES (100, '数据收集技术', '数据技能', '数据收集', 100);
INSERT INTO `capabilities` VALUES (101, '抽样设计', '数据技能', '数据收集', 101);
INSERT INTO `capabilities` VALUES (102, '数据清洗', '数据技能', '数据准备', 102);
INSERT INTO `capabilities` VALUES (103, '问卷设计', '数据技能', '数据收集', 103);
INSERT INTO `capabilities` VALUES (104, '数据可视化', '数据技能', '数据展示', 104);
INSERT INTO `capabilities` VALUES (105, '集中趋势分析', '分析能力', '描述分析', 105);
INSERT INTO `capabilities` VALUES (106, '离散程度分析', '分析能力', '描述分析', 106);
INSERT INTO `capabilities` VALUES (107, '分布形态分析', '分析能力', '描述分析', 107);
INSERT INTO `capabilities` VALUES (108, '概率理解', '理论基础', '知识掌握', 108);
INSERT INTO `capabilities` VALUES (109, '随机变量应用', '分析能力', '概率分析', 109);
INSERT INTO `capabilities` VALUES (110, '概率分布应用', '分析能力', '概率分析', 110);
INSERT INTO `capabilities` VALUES (111, '极限定理理解', '理论基础', '知识掌握', 111);
INSERT INTO `capabilities` VALUES (112, '参数估计能力', '分析能力', '推断分析', 112);
INSERT INTO `capabilities` VALUES (113, '假设检验能力', '分析能力', '推断分析', 113);
INSERT INTO `capabilities` VALUES (114, '区间估计能力', '分析能力', '推断分析', 114);
INSERT INTO `capabilities` VALUES (115, '方差分析能力', '分析能力', '推断分析', 115);
INSERT INTO `capabilities` VALUES (116, '相关分析能力', '分析能力', '关系分析', 116);
INSERT INTO `capabilities` VALUES (117, '一元回归建模', '建模能力', '模型构建', 117);
INSERT INTO `capabilities` VALUES (118, '多元回归建模', '建模能力', '模型构建', 118);
INSERT INTO `capabilities` VALUES (119, '回归诊断能力', '问题解决', '诊断修复', 119);
INSERT INTO `capabilities` VALUES (120, '伦理原则应用', '职业素养', '伦理决策', 120);
INSERT INTO `capabilities` VALUES (121, '规范遵循', '职业素养', '合规意识', 121);
INSERT INTO `capabilities` VALUES (122, '利益冲突处理', '职业素养', '伦理决策', 122);
INSERT INTO `capabilities` VALUES (123, '社会责任践行', '职业素养', '社会责任', 123);
INSERT INTO `capabilities` VALUES (124, '系统思维', '综合能力', '思维模式', 124);
INSERT INTO `capabilities` VALUES (125, '风险收益决策', '综合能力', '决策能力', 125);
INSERT INTO `capabilities` VALUES (126, '创新守正平衡', '综合能力', '创新管理', 126);
INSERT INTO `capabilities` VALUES (127, '信息甄别', '综合能力', '批判思维', 127);
INSERT INTO `capabilities` VALUES (128, '行为偏差识别', '专业能力', '行为分析', 128);
INSERT INTO `capabilities` VALUES (129, '投资者引导', '专业能力', '客户服务', 129);
INSERT INTO `capabilities` VALUES (130, '消费者权益保护', '职业素养', '社会责任', 130);
INSERT INTO `capabilities` VALUES (131, '金融知识普及', '综合能力', '教育传播', 131);
INSERT INTO `capabilities` VALUES (132, '法规理解', '专业能力', '合规意识', 132);
INSERT INTO `capabilities` VALUES (133, '合规实践', '专业能力', '合规管理', 133);
INSERT INTO `capabilities` VALUES (134, '法律风险防控', '专业能力', '风险管理', 134);
INSERT INTO `capabilities` VALUES (135, '国际监管协调', '专业能力', '国际视野', 135);
INSERT INTO `capabilities` VALUES (136, '职业规划', '综合能力', '自我管理', 136);
INSERT INTO `capabilities` VALUES (137, '团队合作', '综合能力', '沟通协作', 137);
INSERT INTO `capabilities` VALUES (138, '金融写作', '综合能力', '沟通协作', 138);
INSERT INTO `capabilities` VALUES (139, '专业沟通', '综合能力', '沟通协作', 139);
INSERT INTO `capabilities` VALUES (140, 'Python编程', '技术能力', '编程技能', 140);
INSERT INTO `capabilities` VALUES (141, '数值计算', '技术能力', '数据处理', 141);
INSERT INTO `capabilities` VALUES (142, '数据分析', '技术能力', '数据处理', 142);
INSERT INTO `capabilities` VALUES (143, '数据可视化', '技术能力', '数据展示', 143);
INSERT INTO `capabilities` VALUES (144, 'API调用', '技术能力', '数据获取', 144);
INSERT INTO `capabilities` VALUES (145, '时间序列分析', '分析能力', '数据分析', 145);
INSERT INTO `capabilities` VALUES (146, '数据清洗', '技术能力', '数据处理', 146);
INSERT INTO `capabilities` VALUES (147, '数据管理', '技术能力', '数据存储', 147);
INSERT INTO `capabilities` VALUES (148, '量化策略', '应用能力', '投资分析', 148);
INSERT INTO `capabilities` VALUES (149, '指标计算', '技术能力', '量化分析', 149);
INSERT INTO `capabilities` VALUES (150, '组合优化', '分析能力', '投资分析', 150);
INSERT INTO `capabilities` VALUES (151, '回测开发', '技术能力', '系统构建', 151);
INSERT INTO `capabilities` VALUES (152, '风险度量', '分析能力', '风险评估', 152);
INSERT INTO `capabilities` VALUES (153, '信用评估', '分析能力', '风险评估', 153);
INSERT INTO `capabilities` VALUES (154, 'VaR计算', '技术能力', '风险量化', 154);
INSERT INTO `capabilities` VALUES (155, '压力测试', '分析能力', '风险分析', 155);
INSERT INTO `capabilities` VALUES (156, '机器学习应用', '技术能力', '智能分析', 156);
INSERT INTO `capabilities` VALUES (157, '区块链应用', '技术能力', '金融科技', 157);
INSERT INTO `capabilities` VALUES (158, '投顾开发', '技术能力', '系统开发', 158);
INSERT INTO `capabilities` VALUES (159, '大数据分析', '分析能力', '数据分析', 159);

-- ----------------------------
-- Table structure for knowledge_points
-- ----------------------------
DROP TABLE IF EXISTS `knowledge_points`;
CREATE TABLE `knowledge_points`  (
  `point_id` int NOT NULL AUTO_INCREMENT,
  `unit_id` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `difficulty` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`point_id`) USING BTREE,
  INDEX `unit_id`(`unit_id` ASC) USING BTREE,
  CONSTRAINT `knowledge_points_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `units` (`unit_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 160 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of knowledge_points
-- ----------------------------
INSERT INTO `knowledge_points` VALUES (1, 1, '计量经济学定义、发展与意义', '低');
INSERT INTO `knowledge_points` VALUES (2, 1, '数据类型与变量分类', '低');
INSERT INTO `knowledge_points` VALUES (3, 1, '描述性统计分析', '低');
INSERT INTO `knowledge_points` VALUES (4, 1, '概率论与数理统计基础', '中');
INSERT INTO `knowledge_points` VALUES (5, 2, '一元线性回归模型设定', '中');
INSERT INTO `knowledge_points` VALUES (6, 2, '普通最小二乘法(OLS)估计', '中');
INSERT INTO `knowledge_points` VALUES (7, 2, '模型拟合优度与假设检验', '中');
INSERT INTO `knowledge_points` VALUES (8, 2, '模型预测与置信区间', '中');
INSERT INTO `knowledge_points` VALUES (9, 3, '多元线性回归模型设定', '中');
INSERT INTO `knowledge_points` VALUES (10, 3, '多重共线性问题', '高');
INSERT INTO `knowledge_points` VALUES (11, 3, '异方差性问题', '高');
INSERT INTO `knowledge_points` VALUES (12, 3, '模型设定误差', '高');
INSERT INTO `knowledge_points` VALUES (13, 4, '虚拟变量回归', '中');
INSERT INTO `knowledge_points` VALUES (14, 4, '逻辑回归模型', '高');
INSERT INTO `knowledge_points` VALUES (15, 4, '非线性回归模型', '高');
INSERT INTO `knowledge_points` VALUES (16, 5, '时间序列基本概念', '中');
INSERT INTO `knowledge_points` VALUES (17, 5, '平稳性检验', '高');
INSERT INTO `knowledge_points` VALUES (18, 5, '协整与误差修正模型', '高');
INSERT INTO `knowledge_points` VALUES (19, 6, '时间序列基本概念与特征', '低');
INSERT INTO `knowledge_points` VALUES (20, 6, '时间序列的组成成分', '中');
INSERT INTO `knowledge_points` VALUES (21, 6, '时间序列可视化方法', '低');
INSERT INTO `knowledge_points` VALUES (22, 6, '自相关与偏自相关分析', '中');
INSERT INTO `knowledge_points` VALUES (23, 7, '移动平均模型(MA)', '中');
INSERT INTO `knowledge_points` VALUES (24, 7, '自回归模型(AR)', '中');
INSERT INTO `knowledge_points` VALUES (25, 7, 'ARMA模型', '高');
INSERT INTO `knowledge_points` VALUES (26, 7, '模型识别与定阶', '高');
INSERT INTO `knowledge_points` VALUES (27, 8, '单位根检验', '高');
INSERT INTO `knowledge_points` VALUES (28, 8, '趋势平稳与差分平稳', '高');
INSERT INTO `knowledge_points` VALUES (29, 8, 'ARIMA模型', '高');
INSERT INTO `knowledge_points` VALUES (30, 8, '季节调整模型', '高');
INSERT INTO `knowledge_points` VALUES (31, 9, '向量自回归模型(VAR)', '高');
INSERT INTO `knowledge_points` VALUES (32, 9, '格兰杰因果关系', '高');
INSERT INTO `knowledge_points` VALUES (33, 9, '脉冲响应函数', '高');
INSERT INTO `knowledge_points` VALUES (34, 9, '方差分解', '高');
INSERT INTO `knowledge_points` VALUES (35, 10, '时间序列预测方法', '中');
INSERT INTO `knowledge_points` VALUES (36, 10, '预测评估指标', '中');
INSERT INTO `knowledge_points` VALUES (37, 10, '时间序列在金融中的应用', '中');
INSERT INTO `knowledge_points` VALUES (38, 10, '时间序列在经济学中的应用', '中');
INSERT INTO `knowledge_points` VALUES (39, 11, '金融学定义与发展', '低');
INSERT INTO `knowledge_points` VALUES (40, 11, '金融体系与金融功能', '中');
INSERT INTO `knowledge_points` VALUES (41, 11, '金融学基本概念与术语', '低');
INSERT INTO `knowledge_points` VALUES (42, 11, '金融与经济发展关系', '中');
INSERT INTO `knowledge_points` VALUES (43, 12, '货币职能与货币形式演进', '低');
INSERT INTO `knowledge_points` VALUES (44, 12, '信用形式与信用体系', '中');
INSERT INTO `knowledge_points` VALUES (45, 12, '利率决定理论与影响因素', '高');
INSERT INTO `knowledge_points` VALUES (46, 12, '货币时间价值', '中');
INSERT INTO `knowledge_points` VALUES (47, 13, '金融市场分类与功能', '中');
INSERT INTO `knowledge_points` VALUES (48, 13, '货币市场与资本市场', '高');
INSERT INTO `knowledge_points` VALUES (49, 13, '股票与债券市场运作', '高');
INSERT INTO `knowledge_points` VALUES (50, 13, '金融衍生品市场', '高');
INSERT INTO `knowledge_points` VALUES (51, 14, '商业银行职能与业务', '中');
INSERT INTO `knowledge_points` VALUES (52, 14, '投资银行与证券公司', '中');
INSERT INTO `knowledge_points` VALUES (53, 14, '保险公司与基金管理公司', '中');
INSERT INTO `knowledge_points` VALUES (54, 14, '中央银行与货币政策', '高');
INSERT INTO `knowledge_points` VALUES (55, 15, '金融风险类型与特征', '中');
INSERT INTO `knowledge_points` VALUES (56, 15, '风险管理基本框架', '高');
INSERT INTO `knowledge_points` VALUES (57, 15, '金融监管体系', '高');
INSERT INTO `knowledge_points` VALUES (58, 15, '金融危机与防范', '高');
INSERT INTO `knowledge_points` VALUES (76, 16, '证券与证券市场基本概念', '低');
INSERT INTO `knowledge_points` VALUES (77, 16, '证券投资的功能与分类', '低');
INSERT INTO `knowledge_points` VALUES (78, 16, '证券市场参与主体', '中');
INSERT INTO `knowledge_points` VALUES (79, 16, '证券发行与交易机制', '中');
INSERT INTO `knowledge_points` VALUES (80, 17, '股票基本特征与类型', '中');
INSERT INTO `knowledge_points` VALUES (81, 17, '股票估值方法', '高');
INSERT INTO `knowledge_points` VALUES (82, 17, '股票基本面分析', '高');
INSERT INTO `knowledge_points` VALUES (83, 17, '股票技术分析', '高');
INSERT INTO `knowledge_points` VALUES (84, 18, '债券特性与类型', '中');
INSERT INTO `knowledge_points` VALUES (85, 18, '债券定价与收益率计算', '高');
INSERT INTO `knowledge_points` VALUES (86, 18, '投资基金分类与运作', '中');
INSERT INTO `knowledge_points` VALUES (87, 18, '基金业绩评价', '高');
INSERT INTO `knowledge_points` VALUES (88, 19, '投资组合理论发展', '中');
INSERT INTO `knowledge_points` VALUES (89, 19, '资产配置策略', '高');
INSERT INTO `knowledge_points` VALUES (90, 19, '风险管理技术', '高');
INSERT INTO `knowledge_points` VALUES (91, 19, '投资绩效评估', '高');
INSERT INTO `knowledge_points` VALUES (92, 20, '证券交易流程', '中');
INSERT INTO `knowledge_points` VALUES (93, 20, '投资策略制定', '高');
INSERT INTO `knowledge_points` VALUES (94, 20, '投资心理与行为金融', '中');
INSERT INTO `knowledge_points` VALUES (95, 20, '证券投资法律法规', '中');
INSERT INTO `knowledge_points` VALUES (96, 21, '统计学定义与发展历程', '低');
INSERT INTO `knowledge_points` VALUES (97, 21, '统计学基本概念与术语', '低');
INSERT INTO `knowledge_points` VALUES (98, 21, '数据类型与变量分类', '低');
INSERT INTO `knowledge_points` VALUES (99, 21, '统计学的应用领域', '低');
INSERT INTO `knowledge_points` VALUES (100, 22, '数据收集方法与技术', '中');
INSERT INTO `knowledge_points` VALUES (101, 22, '抽样调查方法与设计', '中');
INSERT INTO `knowledge_points` VALUES (102, 22, '数据清洗与预处理', '中');
INSERT INTO `knowledge_points` VALUES (103, 22, '调查问卷设计与实施', '中');
INSERT INTO `knowledge_points` VALUES (104, 23, '数据可视化与图表展示', '中');
INSERT INTO `knowledge_points` VALUES (105, 23, '集中趋势度量', '中');
INSERT INTO `knowledge_points` VALUES (106, 23, '离散程度度量', '中');
INSERT INTO `knowledge_points` VALUES (107, 23, '分布形态分析', '中');
INSERT INTO `knowledge_points` VALUES (108, 24, '概率基本概念', '中');
INSERT INTO `knowledge_points` VALUES (109, 24, '随机变量与概率分布', '高');
INSERT INTO `knowledge_points` VALUES (110, 24, '常见概率分布', '高');
INSERT INTO `knowledge_points` VALUES (111, 24, '大数定律与中心极限定理', '高');
INSERT INTO `knowledge_points` VALUES (112, 25, '参数估计方法', '高');
INSERT INTO `knowledge_points` VALUES (113, 25, '假设检验原理', '高');
INSERT INTO `knowledge_points` VALUES (114, 25, '置信区间构建', '高');
INSERT INTO `knowledge_points` VALUES (115, 25, '方差分析', '高');
INSERT INTO `knowledge_points` VALUES (116, 26, '相关分析', '中');
INSERT INTO `knowledge_points` VALUES (117, 26, '一元线性回归', '高');
INSERT INTO `knowledge_points` VALUES (118, 26, '多元线性回归', '高');
INSERT INTO `knowledge_points` VALUES (119, 26, '回归诊断与验证', '高');
INSERT INTO `knowledge_points` VALUES (120, 27, '金融伦理的基本原则与范畴', '中');
INSERT INTO `knowledge_points` VALUES (121, 27, '职业道德与金融行业规范', '中');
INSERT INTO `knowledge_points` VALUES (122, 27, '利益冲突与内幕交易防范', '高');
INSERT INTO `knowledge_points` VALUES (123, 27, '社会责任与可持续金融', '中');
INSERT INTO `knowledge_points` VALUES (124, 28, '系统性思维与金融整体观', '高');
INSERT INTO `knowledge_points` VALUES (125, 28, '风险收益权衡与决策心理', '高');
INSERT INTO `knowledge_points` VALUES (126, 28, '金融创新与守正平衡', '高');
INSERT INTO `knowledge_points` VALUES (127, 28, '批判性思维与信息甄别', '中');
INSERT INTO `knowledge_points` VALUES (128, 29, '行为金融学基础与常见偏差', '中');
INSERT INTO `knowledge_points` VALUES (129, 29, '投资者行为分析与引导', '高');
INSERT INTO `knowledge_points` VALUES (130, 29, '金融消费者权益保护', '中');
INSERT INTO `knowledge_points` VALUES (131, 29, '金融普及教育与素养提升', '中');
INSERT INTO `knowledge_points` VALUES (132, 30, '金融监管体系与核心法规', '中');
INSERT INTO `knowledge_points` VALUES (133, 30, '合规管理与实践', '高');
INSERT INTO `knowledge_points` VALUES (134, 30, '金融犯罪与法律责任', '高');
INSERT INTO `knowledge_points` VALUES (135, 30, '跨境金融监管与国际合作', '高');
INSERT INTO `knowledge_points` VALUES (136, 31, '金融职业路径与能力模型', '低');
INSERT INTO `knowledge_points` VALUES (137, 31, '团队协作与项目管理', '中');
INSERT INTO `knowledge_points` VALUES (138, 31, '金融写作与报告呈现', '中');
INSERT INTO `knowledge_points` VALUES (139, 31, '专业演讲与客户沟通', '中');
INSERT INTO `knowledge_points` VALUES (140, 32, 'Python基础语法与数据结构', '中');
INSERT INTO `knowledge_points` VALUES (141, 32, 'NumPy数值计算与数组操作', '中');
INSERT INTO `knowledge_points` VALUES (142, 32, 'Pandas数据分析库应用', '高');
INSERT INTO `knowledge_points` VALUES (143, 32, 'Matplotlib金融数据可视化', '中');
INSERT INTO `knowledge_points` VALUES (144, 33, '金融API接口调用与数据获取', '高');
INSERT INTO `knowledge_points` VALUES (145, 33, '金融时间序列数据处理', '高');
INSERT INTO `knowledge_points` VALUES (146, 33, '数据清洗与异常值处理', '高');
INSERT INTO `knowledge_points` VALUES (147, 33, '大数据存储与管理技术', '高');
INSERT INTO `knowledge_points` VALUES (148, 34, '量化投资策略基础', '高');
INSERT INTO `knowledge_points` VALUES (149, 34, '技术指标计算与应用', '高');
INSERT INTO `knowledge_points` VALUES (150, 34, '投资组合优化模型', '高');
INSERT INTO `knowledge_points` VALUES (151, 34, '回测系统构建与评估', '高');
INSERT INTO `knowledge_points` VALUES (152, 35, '市场风险度量模型', '高');
INSERT INTO `knowledge_points` VALUES (153, 35, '信用风险评估方法', '高');
INSERT INTO `knowledge_points` VALUES (154, 35, 'VaR风险价值计算', '高');
INSERT INTO `knowledge_points` VALUES (155, 35, '压力测试与情景分析', '高');
INSERT INTO `knowledge_points` VALUES (156, 36, '机器学习在金融中的应用', '高');
INSERT INTO `knowledge_points` VALUES (157, 36, '区块链金融应用实践', '高');
INSERT INTO `knowledge_points` VALUES (158, 36, '智能投顾系统开发', '高');
INSERT INTO `knowledge_points` VALUES (159, 36, '金融大数据分析案例', '高');

-- ----------------------------
-- Table structure for resources
-- ----------------------------
DROP TABLE IF EXISTS `resources`;
CREATE TABLE `resources`  (
  `resource_id` int NOT NULL AUTO_INCREMENT,
  `capability_id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'markdown',
  `url` varchar(768) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`resource_id`) USING BTREE,
  UNIQUE INDEX `url`(`url` ASC) USING BTREE,
  INDEX `capability_id`(`capability_id` ASC) USING BTREE,
  CONSTRAINT `resources_ibfk_1` FOREIGN KEY (`capability_id`) REFERENCES `capabilities` (`capability_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 160 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resources
-- ----------------------------
INSERT INTO `resources` VALUES (1, 1, '计量经济学导论', 'markdown', '/resources/intro_to_econometrics.md');
INSERT INTO `resources` VALUES (2, 1, '计量经济学发展简史', 'markdown', '/resources/history_of_econometrics.md');
INSERT INTO `resources` VALUES (3, 2, '数据清洗与整理指南', 'markdown', '/resources/data_cleaning_guide.md');
INSERT INTO `resources` VALUES (4, 3, '描述性统计分析案例', 'markdown', '/resources/descriptive_stats_case.md');
INSERT INTO `resources` VALUES (5, 4, '统计推断基础教程', 'markdown', '/resources/statistical_inference_tutorial.md');
INSERT INTO `resources` VALUES (6, 5, '线性回归模型设定', 'markdown', '/resources/linear_regression_specification.md');
INSERT INTO `resources` VALUES (7, 6, 'OLS估计原理详解', 'markdown', '/resources/ols_estimation_details.md');
INSERT INTO `resources` VALUES (8, 7, '假设检验方法', 'markdown', '/resources/hypothesis_testing_methods.md');
INSERT INTO `resources` VALUES (9, 8, '预测分析技术', 'markdown', '/resources/prediction_techniques.md');
INSERT INTO `resources` VALUES (10, 9, '多元回归模型构建', 'markdown', '/resources/multiple_regression_guide.md');
INSERT INTO `resources` VALUES (11, 10, '多重共线性检测与处理', 'markdown', '/resources/multicollinearity_handling.md');
INSERT INTO `resources` VALUES (12, 11, '异方差性检验方法', 'markdown', '/resources/heteroscedasticity_testing.md');
INSERT INTO `resources` VALUES (13, 12, '模型诊断技术', 'markdown', '/resources/model_diagnostic_techniques.md');
INSERT INTO `resources` VALUES (14, 13, '虚拟变量应用案例', 'markdown', '/resources/dummy_variables_applications.md');
INSERT INTO `resources` VALUES (15, 14, '非线性回归模型', 'markdown', '/resources/nonlinear_regression_models.md');
INSERT INTO `resources` VALUES (16, 15, '时间序列分析基础', 'markdown', '/resources/time_series_basics.md');
INSERT INTO `resources` VALUES (17, 16, '平稳性检验方法', 'markdown', '/resources/stationarity_testing.md');
INSERT INTO `resources` VALUES (18, 17, '协整分析实战', 'markdown', '/resources/cointegration_analysis.md');
INSERT INTO `resources` VALUES (19, 18, '时间序列基本概念', 'markdown', '/resources/ts_basic_concepts.md');
INSERT INTO `resources` VALUES (20, 19, '时间序列成分分解方法', 'markdown', '/resources/ts_decomposition.md');
INSERT INTO `resources` VALUES (21, 20, '时间序列可视化技术', 'markdown', '/resources/ts_visualization.md');
INSERT INTO `resources` VALUES (22, 21, '自相关分析指南', 'markdown', '/resources/autocorrelation_analysis.md');
INSERT INTO `resources` VALUES (23, 22, 'MA模型详解', 'markdown', '/resources/ma_models.md');
INSERT INTO `resources` VALUES (24, 23, 'AR模型详解', 'markdown', '/resources/ar_models.md');
INSERT INTO `resources` VALUES (25, 24, 'ARMA模型应用', 'markdown', '/resources/arma_models.md');
INSERT INTO `resources` VALUES (26, 25, '模型识别与定阶方法', 'markdown', '/resources/model_identification.md');
INSERT INTO `resources` VALUES (27, 26, '单位根检验方法', 'markdown', '/resources/unit_root_tests.md');
INSERT INTO `resources` VALUES (28, 27, '差分处理方法', 'markdown', '/resources/differencing_methods.md');
INSERT INTO `resources` VALUES (29, 28, 'ARIMA建模指南', 'markdown', '/resources/arima_modeling.md');
INSERT INTO `resources` VALUES (30, 29, '季节调整技术', 'markdown', '/resources/seasonal_adjustment.md');
INSERT INTO `resources` VALUES (31, 30, 'VAR模型构建', 'markdown', '/resources/var_models.md');
INSERT INTO `resources` VALUES (32, 31, '格兰杰因果检验', 'markdown', '/resources/granger_causality.md');
INSERT INTO `resources` VALUES (33, 32, '脉冲响应分析', 'markdown', '/resources/impulse_response.md');
INSERT INTO `resources` VALUES (34, 33, '方差分解技术', 'markdown', '/resources/variance_decomposition.md');
INSERT INTO `resources` VALUES (35, 34, '时间序列预测方法', 'markdown', '/resources/ts_forecasting.md');
INSERT INTO `resources` VALUES (36, 35, '预测准确性评估', 'markdown', '/resources/forecast_evaluation.md');
INSERT INTO `resources` VALUES (37, 36, '金融时间序列分析', 'markdown', '/resources/financial_ts.md');
INSERT INTO `resources` VALUES (38, 37, '经济时间序列应用', 'markdown', '/resources/economic_ts_applications.md');
INSERT INTO `resources` VALUES (39, 38, '金融学导论', 'markdown', '/resources/finance_introduction.md');
INSERT INTO `resources` VALUES (40, 39, '金融体系解析', 'markdown', '/resources/financial_system_analysis.md');
INSERT INTO `resources` VALUES (41, 40, '金融术语词典', 'markdown', '/resources/financial_glossary.md');
INSERT INTO `resources` VALUES (42, 41, '金融与经济发展', 'markdown', '/resources/finance_economy_relation.md');
INSERT INTO `resources` VALUES (43, 42, '货币职能与演进', 'markdown', '/resources/money_functions_evolution.md');
INSERT INTO `resources` VALUES (44, 43, '信用形式与应用', 'markdown', '/resources/credit_forms_applications.md');
INSERT INTO `resources` VALUES (45, 44, '利率决定理论', 'markdown', '/resources/interest_rate_theories.md');
INSERT INTO `resources` VALUES (46, 45, '货币时间价值计算', 'markdown', '/resources/time_value_calculation.md');
INSERT INTO `resources` VALUES (47, 46, '金融市场分类', 'markdown', '/resources/financial_market_classification.md');
INSERT INTO `resources` VALUES (48, 47, '货币市场分析', 'markdown', '/resources/money_market_analysis.md');
INSERT INTO `resources` VALUES (49, 48, '股票债券市场指南', 'markdown', '/resources/stock_bond_markets.md');
INSERT INTO `resources` VALUES (50, 49, '金融衍生品基础', 'markdown', '/resources/derivatives_basics.md');
INSERT INTO `resources` VALUES (51, 50, '商业银行实务', 'markdown', '/resources/commercial_banking_practices.md');
INSERT INTO `resources` VALUES (52, 51, '投资银行业务', 'markdown', '/resources/investment_banking_operations.md');
INSERT INTO `resources` VALUES (53, 52, '保险与基金业务', 'markdown', '/resources/insurance_fund_operations.md');
INSERT INTO `resources` VALUES (54, 53, '货币政策分析', 'markdown', '/resources/monetary_policy_analysis.md');
INSERT INTO `resources` VALUES (55, 54, '金融风险识别', 'markdown', '/resources/financial_risk_identification.md');
INSERT INTO `resources` VALUES (56, 55, '风险管理框架', 'markdown', '/resources/risk_management_framework.md');
INSERT INTO `resources` VALUES (57, 56, '金融监管体系', 'markdown', '/resources/financial_regulation_system.md');
INSERT INTO `resources` VALUES (58, 57, '金融危机与防范', 'markdown', '/resources/financial_crises_prevention.md');
INSERT INTO `resources` VALUES (76, 76, '证券市场基础概念', 'markdown', '/resources/security_market_basics.md');
INSERT INTO `resources` VALUES (77, 77, '证券投资功能与分类', 'markdown', '/resources/investment_functions_classification.md');
INSERT INTO `resources` VALUES (78, 78, '证券市场参与主体详解', 'markdown', '/resources/market_participants.md');
INSERT INTO `resources` VALUES (79, 79, '证券发行与交易机制', 'markdown', '/resources/issuing_trading_mechanism.md');
INSERT INTO `resources` VALUES (80, 80, '股票特性与类型', 'markdown', '/resources/stock_characteristics_types.md');
INSERT INTO `resources` VALUES (81, 81, '股票估值方法详解', 'markdown', '/resources/stock_valuation_methods.md');
INSERT INTO `resources` VALUES (82, 82, '股票基本面分析指南', 'markdown', '/resources/fundamental_analysis_guide.md');
INSERT INTO `resources` VALUES (83, 83, '股票技术分析教程', 'markdown', '/resources/technical_analysis_tutorial.md');
INSERT INTO `resources` VALUES (84, 84, '债券特性与类型介绍', 'markdown', '/resources/bond_characteristics_types.md');
INSERT INTO `resources` VALUES (85, 85, '债券定价与收益率计算', 'markdown', '/resources/bond_pricing_yield.md');
INSERT INTO `resources` VALUES (86, 86, '投资基金分类与运作', 'markdown', '/resources/fund_classification_operations.md');
INSERT INTO `resources` VALUES (87, 87, '基金业绩评价方法', 'markdown', '/resources/fund_performance_evaluation.md');
INSERT INTO `resources` VALUES (88, 88, '投资组合理论发展', 'markdown', '/resources/portfolio_theory_development.md');
INSERT INTO `resources` VALUES (89, 89, '资产配置策略指南', 'markdown', '/resources/asset_allocation_strategies.md');
INSERT INTO `resources` VALUES (90, 90, '风险管理技术手册', 'markdown', '/resources/risk_management_techniques.md');
INSERT INTO `resources` VALUES (91, 91, '投资绩效评估方法', 'markdown', '/resources/investment_performance_evaluation.md');
INSERT INTO `resources` VALUES (92, 92, '证券交易流程详解', 'markdown', '/resources/securities_trading_process.md');
INSERT INTO `resources` VALUES (93, 93, '投资策略制定指南', 'markdown', '/resources/investment_strategy_development.md');
INSERT INTO `resources` VALUES (94, 94, '投资心理与行为金融', 'markdown', '/resources/investment_psychology_behavioral.md');
INSERT INTO `resources` VALUES (95, 95, '证券投资法律法规', 'markdown', '/resources/securities_laws_regulations.md');
INSERT INTO `resources` VALUES (96, 96, '统计学导论', 'markdown', '/resources/statistics_introduction.md');
INSERT INTO `resources` VALUES (97, 97, '统计学基本术语', 'markdown', '/resources/statistical_terminology.md');
INSERT INTO `resources` VALUES (98, 98, '数据类型与分类', 'markdown', '/resources/data_types_classification.md');
INSERT INTO `resources` VALUES (99, 99, '统计学应用领域', 'markdown', '/resources/statistics_applications.md');
INSERT INTO `resources` VALUES (100, 100, '数据收集方法', 'markdown', '/resources/data_collection_methods.md');
INSERT INTO `resources` VALUES (101, 101, '抽样调查技术', 'markdown', '/resources/sampling_techniques.md');
INSERT INTO `resources` VALUES (102, 102, '数据清洗与预处理', 'markdown', '/resources/data_cleaning_preprocessing.md');
INSERT INTO `resources` VALUES (103, 103, '调查问卷设计指南', 'markdown', '/resources/questionnaire_design.md');
INSERT INTO `resources` VALUES (104, 104, '数据可视化技术', 'markdown', '/resources/data_visualization_techniques.md');
INSERT INTO `resources` VALUES (105, 105, '集中趋势度量方法', 'markdown', '/resources/central_tendency_measures.md');
INSERT INTO `resources` VALUES (106, 106, '离散程度度量方法', 'markdown', '/resources/dispersion_measures.md');
INSERT INTO `resources` VALUES (107, 107, '分布形态分析', 'markdown', '/resources/distribution_analysis.md');
INSERT INTO `resources` VALUES (108, 108, '概率论基础', 'markdown', '/resources/probability_basics.md');
INSERT INTO `resources` VALUES (109, 109, '随机变量与应用', 'markdown', '/resources/random_variables.md');
INSERT INTO `resources` VALUES (110, 110, '常见概率分布', 'markdown', '/resources/probability_distributions.md');
INSERT INTO `resources` VALUES (111, 111, '大数定律与中心极限定理', 'markdown', '/resources/law_of_large_numbers_clt.md');
INSERT INTO `resources` VALUES (112, 112, '参数估计方法', 'markdown', '/resources/parameter_estimation.md');
INSERT INTO `resources` VALUES (113, 113, '假设检验原理与应用', 'markdown', '/resources/hypothesis_testing.md');
INSERT INTO `resources` VALUES (114, 114, '置信区间构建', 'markdown', '/resources/confidence_intervals.md');
INSERT INTO `resources` VALUES (115, 115, '方差分析教程', 'markdown', '/resources/analysis_of_variance.md');
INSERT INTO `resources` VALUES (116, 116, '相关分析技术', 'markdown', '/resources/correlation_analysis.md');
INSERT INTO `resources` VALUES (117, 117, '一元线性回归', 'markdown', '/resources/simple_linear_regression.md');
INSERT INTO `resources` VALUES (118, 118, '多元线性回归', 'markdown', '/resources/multiple_linear_regression.md');
INSERT INTO `resources` VALUES (119, 119, '回归诊断与验证', 'markdown', '/resources/regression_diagnostics.md');
INSERT INTO `resources` VALUES (120, 120, '金融伦理基本原则', 'markdown', '/resources/financial_ethics_basics.md');
INSERT INTO `resources` VALUES (121, 121, '金融行业职业道德规范', 'markdown', '/resources/professional_ethics_norms.md');
INSERT INTO `resources` VALUES (122, 122, '利益冲突防范指南', 'markdown', '/resources/conflict_of_interest_prevention.md');
INSERT INTO `resources` VALUES (123, 123, '社会责任与可持续金融', 'markdown', '/resources/social_responsibility_sustainable_finance.md');
INSERT INTO `resources` VALUES (124, 124, '金融系统性思维', 'markdown', '/resources/financial_systemic_thinking.md');
INSERT INTO `resources` VALUES (125, 125, '风险收益权衡决策', 'markdown', '/resources/risk_return_decision_making.md');
INSERT INTO `resources` VALUES (126, 126, '金融创新的边界与平衡', 'markdown', '/resources/financial_innovation_balance.md');
INSERT INTO `resources` VALUES (127, 127, '金融信息甄别与批判性思维', 'markdown', '/resources/information_screening_critical_thinking.md');
INSERT INTO `resources` VALUES (128, 128, '行为金融常见偏差', 'markdown', '/resources/behavioral_finance_biases.md');
INSERT INTO `resources` VALUES (129, 129, '投资者行为分析与引导方法', 'markdown', '/resources/investor_behavior_guidance.md');
INSERT INTO `resources` VALUES (130, 130, '金融消费者权益保护体系', 'markdown', '/resources/financial_consumer_protection.md');
INSERT INTO `resources` VALUES (131, 131, '金融知识普及策略与技巧', 'markdown', '/resources/financial_literacy_popularization.md');
INSERT INTO `resources` VALUES (132, 132, '金融监管核心法规解读', 'markdown', '/resources/financial_regulations_core.md');
INSERT INTO `resources` VALUES (133, 133, '合规管理实践操作', 'markdown', '/resources/compliance_management_practices.md');
INSERT INTO `resources` VALUES (134, 134, '金融犯罪类型与法律责任', 'markdown', '/resources/financial_crimes_liabilities.md');
INSERT INTO `resources` VALUES (135, 135, '跨境金融监管合作', 'markdown', '/resources/cross_border_regulatory_cooperation.md');
INSERT INTO `resources` VALUES (136, 136, '金融职业发展路径规划', 'markdown', '/resources/financial_career_path_planning.md');
INSERT INTO `resources` VALUES (137, 137, '金融团队协作与项目管理', 'markdown', '/resources/financial_teamwork_project_management.md');
INSERT INTO `resources` VALUES (138, 138, '金融写作与报告撰写技巧', 'markdown', '/resources/financial_writing_reporting_skills.md');
INSERT INTO `resources` VALUES (139, 139, '金融专业演讲与客户沟通', 'markdown', '/resources/financial_presentation_client_communication.md');
INSERT INTO `resources` VALUES (140, 140, 'Python金融编程基础教程', 'markdown', '/resources/python_finance_basics.md');
INSERT INTO `resources` VALUES (141, 141, 'NumPy金融计算指南', 'markdown', '/resources/numpy_financial_calculations.md');
INSERT INTO `resources` VALUES (142, 142, 'Pandas金融数据分析', 'markdown', '/resources/pandas_financial_analysis.md');
INSERT INTO `resources` VALUES (143, 143, '金融数据可视化技术', 'markdown', '/resources/financial_data_visualization.md');
INSERT INTO `resources` VALUES (144, 144, '金融API接口调用实战', 'markdown', '/resources/financial_api_integration.md');
INSERT INTO `resources` VALUES (145, 145, '金融时间序列处理', 'markdown', '/resources/financial_time_series.md');
INSERT INTO `resources` VALUES (146, 146, '金融数据清洗与预处理', 'markdown', '/resources/financial_data_cleaning.md');
INSERT INTO `resources` VALUES (147, 147, '金融大数据存储管理', 'markdown', '/resources/financial_bigdata_management.md');
INSERT INTO `resources` VALUES (148, 148, '量化投资策略开发', 'markdown', '/resources/quantitative_strategies.md');
INSERT INTO `resources` VALUES (149, 149, '技术指标计算与应用', 'markdown', '/resources/technical_indicators.md');
INSERT INTO `resources` VALUES (150, 150, '投资组合优化模型', 'markdown', '/resources/portfolio_optimization.md');
INSERT INTO `resources` VALUES (151, 151, '回测系统构建指南', 'markdown', '/resources/backtesting_systems.md');
INSERT INTO `resources` VALUES (152, 152, '市场风险度量方法', 'markdown', '/resources/market_risk_measurement.md');
INSERT INTO `resources` VALUES (153, 153, '信用风险评估模型', 'markdown', '/resources/credit_risk_assessment.md');
INSERT INTO `resources` VALUES (154, 154, 'VaR计算方法与实践', 'markdown', '/resources/var_calculation.md');
INSERT INTO `resources` VALUES (155, 155, '金融压力测试技术', 'markdown', '/resources/financial_stress_testing.md');
INSERT INTO `resources` VALUES (156, 156, '机器学习金融应用', 'markdown', '/resources/ml_in_finance.md');
INSERT INTO `resources` VALUES (157, 157, '区块链金融实践', 'markdown', '/resources/blockchain_finance.md');
INSERT INTO `resources` VALUES (158, 158, '智能投顾系统开发', 'markdown', '/resources/robo_advisor_development.md');
INSERT INTO `resources` VALUES (159, 159, '金融大数据分析案例', 'markdown', '/resources/financial_bigdata_cases.md');

-- ----------------------------
-- Table structure for units
-- ----------------------------
DROP TABLE IF EXISTS `units`;
CREATE TABLE `units`  (
  `unit_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `course_id` int NOT NULL,
  PRIMARY KEY (`unit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of units
-- ----------------------------
INSERT INTO `units` VALUES (1, '计量经济学基础', 101);
INSERT INTO `units` VALUES (2, '一元线性回归模型', 101);
INSERT INTO `units` VALUES (3, '多元线性回归模型', 101);
INSERT INTO `units` VALUES (4, '回归问题拓展', 101);
INSERT INTO `units` VALUES (5, '时间序列分析', 101);
INSERT INTO `units` VALUES (6, '时间序列分析基础', 102);
INSERT INTO `units` VALUES (7, '平稳时间序列模型', 102);
INSERT INTO `units` VALUES (8, '非平稳时间序列分析', 102);
INSERT INTO `units` VALUES (9, '多元时间序列模型', 102);
INSERT INTO `units` VALUES (10, '时间序列预测与应用', 102);
INSERT INTO `units` VALUES (11, '金融学基础', 103);
INSERT INTO `units` VALUES (12, '货币与信用', 103);
INSERT INTO `units` VALUES (13, '金融市场', 103);
INSERT INTO `units` VALUES (14, '金融机构', 103);
INSERT INTO `units` VALUES (15, '金融风险与管理', 103);
INSERT INTO `units` VALUES (16, '证券投资基础概念', 104);
INSERT INTO `units` VALUES (17, '股票投资分析', 104);
INSERT INTO `units` VALUES (18, '债券与基金投资', 104);
INSERT INTO `units` VALUES (19, '投资组合理论', 104);
INSERT INTO `units` VALUES (20, '证券投资实务', 104);
INSERT INTO `units` VALUES (21, '统计学基础概念', 105);
INSERT INTO `units` VALUES (22, '数据收集与整理', 105);
INSERT INTO `units` VALUES (23, '描述性统计分析', 105);
INSERT INTO `units` VALUES (24, '概率论基础', 105);
INSERT INTO `units` VALUES (25, '统计推断', 105);
INSERT INTO `units` VALUES (26, '相关与回归分析', 105);
INSERT INTO `units` VALUES (27, '金融伦理与职业道德', 106);
INSERT INTO `units` VALUES (28, '金融思维与决策框架', 106);
INSERT INTO `units` VALUES (29, '行为金融与投资者教育', 106);
INSERT INTO `units` VALUES (30, '金融法律法规与合规', 106);
INSERT INTO `units` VALUES (31, '职业规划与沟通表达', 106);
INSERT INTO `units` VALUES (32, 'Python金融编程基础', 107);
INSERT INTO `units` VALUES (33, '金融数据获取与处理', 107);
INSERT INTO `units` VALUES (34, '量化投资分析', 107);
INSERT INTO `units` VALUES (35, '风险管理模型构建', 107);
INSERT INTO `units` VALUES (36, '金融科技应用实战', 107);

SET FOREIGN_KEY_CHECKS = 1;
