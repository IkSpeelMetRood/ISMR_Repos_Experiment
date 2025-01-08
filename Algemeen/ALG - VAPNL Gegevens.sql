vattenfall.west-europe.azure.snowflakecomputing.com
ECP_XSMALL
VAP_TST_VAPNL_ECP_ANALYST
VAP_PRD_VAPNL_ECP_ANALYST


    Source = Snowflake.Databases("vattenfall.west-europe.azure.snowflakecomputing.com","ECP_XSMALL",[Role="VAP_TST_VAPNL_ECP_ANALYST"]),
    VAP_TST_VAPNL_ECP_Database = Source{[Name="VAP_TST_VAPNL_ECP",Kind="Database"]}[Data],
    ANALYSE_PMN_Schema = VAP_TST_VAPNL_ECP_Database{[Name="ANALYSE_PMN",Kind="Schema"]}[Data],

    Bron = Snowflake.Databases("vattenfall.west-europe.azure.snowflakecomputing.com","ECP_XSMALL",[Role="VAP_TST_VAPNL_ECP_ANALYST"]),
    VAP_TST_VAPNL_ECP_Database = Bron{[Name="VAP_TST_VAPNL_ECP",Kind="Database"]}[Data],
    ANALYSE_PMN_Schema = VAP_TST_VAPNL_ECP_Database{[Name="ANALYSE_PMN",Kind="Schema"]}[Data],
	
    Bron = Snowflake.Databases("vattenfall.west-europe.azure.snowflakecomputing.com","ECP_XSMALL"),
    VAP_PRD_VAPNL_ECP_Database = Bron{[Name="VAP_PRD_VAPNL_ECP",Kind="Database"]}[Data],
    ANALYSE_PMN_Schema = VAP_PRD_VAPNL_ECP_Database{[Name="ANALYSE_PMN",Kind="Schema"]}[Data],