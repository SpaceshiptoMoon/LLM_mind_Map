USE mindmap;

-- 插入时间序列课程的学习单元数据
INSERT INTO units (unit_id, name, course_id) VALUES
(6, '时间序列分析基础', 102),
(7, '平稳时间序列模型', 102),
(8, '非平稳时间序列分析', 102),
(9, '多元时间序列模型', 102),
(10, '时间序列预测与应用', 102);

-- 插入时间序列课程的知识点数据
INSERT INTO knowledge_points (point_id, unit_id, description, difficulty) VALUES
(19, 6, '时间序列基本概念与特征', '低'),
(20, 6, '时间序列的组成成分', '中'),
(21, 6, '时间序列可视化方法', '低'),
(22, 6, '自相关与偏自相关分析', '中'),
(23, 7, '移动平均模型(MA)', '中'),
(24, 7, '自回归模型(AR)', '中'),
(25, 7, 'ARMA模型', '高'),
(26, 7, '模型识别与定阶', '高'),
(27, 8, '单位根检验', '高'),
(28, 8, '趋势平稳与差分平稳', '高'),
(29, 8, 'ARIMA模型', '高'),
(30, 8, '季节调整模型', '高'),
(31, 9, '向量自回归模型(VAR)', '高'),
(32, 9, '格兰杰因果关系', '高'),
(33, 9, '脉冲响应函数', '高'),
(34, 9, '方差分解', '高'),
(35, 10, '时间序列预测方法', '中'),
(36, 10, '预测评估指标', '中'),
(37, 10, '时间序列在金融中的应用', '中'),
(38, 10, '时间序列在经济学中的应用', '中');

-- 插入时间序列课程的能力项数据
INSERT INTO capabilities (capability_id, name, category, subcategory, point_id) VALUES
(18, '序列特性识别', '理论基础', '知识掌握', 19),
(19, '成分分解', '数据分析', '数据准备', 20),
(20, '时序可视化', '数据技能', '数据展示', 21),
(21, '相关性分析', '数据分析', '关系分析', 22),
(22, 'MA模型构建', '建模能力', '模型构建', 23),
(23, 'AR模型构建', '建模能力', '模型构建', 24),
(24, 'ARMA模型应用', '建模能力', '模型估计', 25),
(25, '模型识别', '问题解决', '诊断修复', 26),
(26, '平稳性检验', '问题解决', '诊断修复', 27),
(27, '差分处理', '数据技能', '数据转换', 28),
(28, 'ARIMA建模', '建模能力', '模型构建', 29),
(29, '季节调整', '问题解决', '诊断修复', 30),
(30, 'VAR模型构建', '建模能力', '模型构建', 31),
(31, '因果关系检验', '问题解决', '诊断修复', 32),
(32, '脉冲响应分析', '应用能力', '高级技巧', 33),
(33, '方差分解分析', '应用能力', '高级技巧', 34),
(34, '预测技术', '应用能力', '预测分析', 35),
(35, '预测评估', '应用能力', '模型验证', 36),
(36, '金融应用', '应用能力', '领域应用', 37),
(37, '经济应用', '应用能力', '领域应用', 38);

-- 插入时间序列课程的学习资源数据（全部为markdown格式）
INSERT INTO resources (resource_id, capability_id, name, type, url) VALUES
(19, 18, '时间序列基本概念', 'markdown', '/resources/ts_basic_concepts.md'),
(20, 19, '时间序列成分分解方法', 'markdown', '/resources/ts_decomposition.md'),
(21, 20, '时间序列可视化技术', 'markdown', '/resources/ts_visualization.md'),
(22, 21, '自相关分析指南', 'markdown', '/resources/autocorrelation_analysis.md'),
(23, 22, 'MA模型详解', 'markdown', '/resources/ma_models.md'),
(24, 23, 'AR模型详解', 'markdown', '/resources/ar_models.md'),
(25, 24, 'ARMA模型应用', 'markdown', '/resources/arma_models.md'),
(26, 25, '模型识别与定阶方法', 'markdown', '/resources/model_identification.md'),
(27, 26, '单位根检验方法', 'markdown', '/resources/unit_root_tests.md'),
(28, 27, '差分处理方法', 'markdown', '/resources/differencing_methods.md'),
(29, 28, 'ARIMA建模指南', 'markdown', '/resources/arima_modeling.md'),
(30, 29, '季节调整技术', 'markdown', '/resources/seasonal_adjustment.md'),
(31, 30, 'VAR模型构建', 'markdown', '/resources/var_models.md'),
(32, 31, '格兰杰因果检验', 'markdown', '/resources/granger_causality.md'),
(33, 32, '脉冲响应分析', 'markdown', '/resources/impulse_response.md'),
(34, 33, '方差分解技术', 'markdown', '/resources/variance_decomposition.md'),
(35, 34, '时间序列预测方法', 'markdown', '/resources/ts_forecasting.md'),
(36, 35, '预测准确性评估', 'markdown', '/resources/forecast_evaluation.md'),
(37, 36, '金融时间序列分析', 'markdown', '/resources/financial_ts.md'),
(38, 37, '经济时间序列应用', 'markdown', '/resources/economic_ts_applications.md');