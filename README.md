# 1. 课程图谱可视化程序
    本项目基于python语言, Mysql语言实现了课程图谱树图和环图可视化，并且支持大模型自动生成知识点信息。

# 2. 快速开始
    - 数据库要求: utils\configs\db_config.json中json文件配置数据库信息,输入自己数据库信息
    - 大模型配置要求: utils\deep_research_plus_minimal\.env中输入自己LLM_MODEL， OPENAI_API_KEY， SEARCH_API
    - app_fastapi.py 为启动程序入口

# 3. 文件结构介绍
## 3.1 KNOWLAGE_GRAPH文件结构
    C:.
    │  app_fastapi.py
    │  exm.html
    │  exm_.html
    │  README.md
    │  requirements.txt
    │  test.py
    │
    ├─.vscode
    │      launch.json
    │
    ├─Database_sqlfiles
    │      101.sql
    │      102.sql
    │      103.sql
    │      delete_table.sql
    │
    ├─resources
    │      cointegration_analysis.md
    │      data_cleaning_guide.md
    │      descriptive_stats_case.md
    │      dummy_variables_applications.md
    │      heteroscedasticity_testing.md
    │      history_of_econometrics.md
    │      hypothesis_testing_methods.md
    │      intro_to_econometrics.md
    │      linear_regression_specification.md
    │      model_diagnostic_techniques.md
    │      multicollinearity_handling.md
    │      multiple_regression_guide.md
    │      nonlinear_regression_models.md
    │      ols_estimation_details.md
    │      prediction_techniques.md
    │      stationarity_testing.md
    │      statistical_inference_tutorial.md
    │      time_series_basics.md
    │
    └─utils
        │  generatemarkdown_llm.py
        │
        ├─configs
        │      db_config.json
        │      __init__.py
        │
        ├─database_tools
        │      db_operation.py
        │      resource_info.py
        │
        └─deep_research_plus_minimal
            │  .env
            │  config.py
            │  graph.py
            │  llm.py
            │  reporter.py
            │  run.py
            │  schemas.py
            │
            ├─agents
            │      fact_check.py
            │      researcher.py
            │      supervisor.py
            │      writer.py
            │
            └─tools
                    search.py
    - Database_sqlfiles : 数据库sql文件
    - resources : 知识点材料
    - utils : 工具列表
      - configs: 数据库配置文件
      - database_tools: 数据库操作脚本
      - deep_research_plus_minimal: agent工具脚本和配置脚本

