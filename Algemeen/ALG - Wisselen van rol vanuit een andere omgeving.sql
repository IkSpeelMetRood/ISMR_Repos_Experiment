------------------------------------------------------------------------
-- Wisselen van rol vanuit een andere omgeving
-- Dus bijv vanuit PRD toch gegegens lezen uit DEV
------------------------------------------------------------------------
        
------------------------------------------------------------------------
-- Vanuit bijv. PRD toch gegevens lezen uit DEV
-- Regels selecteren en <ALT>+ X
------------------------------------------------------------------------
USE ROLE VAP_DEV_VAPNL_ECP_ANALYST;
USE WAREHOUSE ECP_XSMALL;
USE DATABASE VAP_DEV_VAPNL_ECP;
SELECT * FROM OWNER_GN.GN_A_USER_V limit 1;

------------------------------------------------------------------------
-- Vanuit bijv. DEV toch gegevens lezen uit PRD
-- Regels selecteren en <ALT>+ X
------------------------------------------------------------------------
USE ROLE VAP_PRD_VAPNL_ECP_ANALYST;
USE WAREHOUSE ECP_XSMALL;
USE DATABASE VAP_PRD_VAPNL_ECP;
SELECT * FROM OWNER_GN.GN_A_USER_V limit 1;

------------------------------------------------------------------------