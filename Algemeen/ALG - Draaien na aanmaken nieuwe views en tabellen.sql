------------------------------------------------------------------------
-- PRODUCTIE
------------------------------------------------------------------------
------------------------------------------------------------------------
-- Grant is noodzakelijk na zelf aanmaken van views in ANALYSE_PMN
-- Let op: Dit is voor de ANALYST user
------------------------------------------------------------------------
GRANT SELECT ON ALL VIEWS
IN SCHEMA VAP_PRD_VAPNL_ECP.ANALYSE_PMN
TO ROLE VAP_PRD_VAPNL_ECP_ANALYST;

------------------------------------------------------------------------
-- Grant is noodzakelijk na zelf aanmaken van views in ANALYSE_PMN
-- Let op: Dit is voor de de PORTAL user
------------------------------------------------------------------------
GRANT SELECT ON ALL VIEWS
IN SCHEMA VAP_PRD_VAPNL_ECP.ANALYSE_PMN
TO ROLE VAP_PRD_VAPNL_ECP_PORTAL;

---------------------a---------------------------------------------------
-- Grant is noodzakelijk na zelf aanmaken van tabellen in ANALYSE_PMN
-- Let op: Dit is voor de ANALYST user
------------------------------------------------------------------------
GRANT SELECT ON ALL TABLES
IN SCHEMA VAP_PRD_VAPNL_ECP.ANALYSE_PMN
TO ROLE VAP_PRD_VAPNL_ECP_ANALYST;


------------------------------------------------------------------------
-- TEST
------------------------------------------------------------------------
------------------------------------------------------------------------
-- Grant is noodzakelijk na zelf aanmaken van views in ANALYSE_PMN
-- Let op: Dit is voor de ANALYST user
------------------------------------------------------------------------
GRANT SELECT ON ALL VIEWS
IN SCHEMA VAP_TST_VAPNL_ECP.ANALYSE_PMN
TO ROLE VAP_TST_VAPNL_ECP_ANALYST;

------------------------------------------------------------------------
-- Grant is noodzakelijk na zelf aanmaken van views in ANALYSE_PMN
-- Let op: Dit is voor de de PORTAL user
------------------------------------------------------------------------
GRANT SELECT ON ALL VIEWS
IN SCHEMA VAP_TST_VAPNL_ECP.ANALYSE_PMN
TO ROLE VAP_TST_VAPNL_ECP_PORTAL;

---------------------a---------------------------------------------------
-- Grant is noodzakelijk na zelf aanmaken van tabellen in ANALYSE_PMN
-- Let op: Dit is voor de ANALYST user
------------------------------------------------------------------------
GRANT SELECT ON ALL TABLES
IN SCHEMA VAP_TST_VAPNL_ECP.ANALYSE_PMN
TO ROLE VAP_TST_VAPNL_ECP_ANALYST;


------------------------------------------------------------------------
-- DEVELOPMENT
------------------------------------------------------------------------
------------------------------------------------------------------------
-- Grant is noodzakelijk na zelf aanmaken van views in ANALYSE_PMN
-- Let op: Dit is voor de ANALYST user
------------------------------------------------------------------------
GRANT SELECT ON ALL VIEWS
IN SCHEMA VAP_DEV_VAPNL_ECP.ANALYSE_PMN
TO ROLE VAP_DEV_VAPNL_ECP_ANALYST;

------------------------------------------------------------------------
-- Grant is noodzakelijk na zelf aanmaken van views in ANALYSE_PMN
-- Let op: Dit is voor de de PORTAL user
------------------------------------------------------------------------
GRANT SELECT ON ALL VIEWS
IN SCHEMA VAP_DEV_VAPNL_ECP.ANALYSE_PMN
TO ROLE VAP_DEV_VAPNL_ECP_PORTAL;

---------------------a---------------------------------------------------
-- Grant is noodzakelijk na zelf aanmaken van tabellen in ANALYSE_PMN
-- Let op: Dit is voor de ANALYST user
------------------------------------------------------------------------
GRANT SELECT ON ALL TABLES
IN SCHEMA VAP_DEV_VAPNL_ECP.ANALYSE_PMN
TO ROLE VAP_DEV_VAPNL_ECP_ANALYST;

