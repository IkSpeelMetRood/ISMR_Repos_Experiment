------------------------------------------------------------------------
-- 'Hash_agg' Check of data exact gelijk is
------------------------------------------------------------------------
        
------------------------------------------------------------------------
-- Levert een getal op.
-- Door deze code ook te gebruiken op de nieuwe data zou het getal overeen moeten komen met het origineel.
-- Uitleg: https://docs.snowflake.com/en/sql-reference/functions/hash_agg
------------------------------------------------------------------------
SELECT hash_agg(* EXCLUDE(AUD_DATE_CREATED, AUD_DATE_MODIFIED, AUD_TASK_RUN_ID))  FROM VAP_PRD_VAPNL_ECP.OWNER_GN.GN_A_USER ;
-- Bijv. 3838614165972726873

------------------------------------------------------------------------
-- Voorbeeld: Als alle data gelijk is moeten beide exact hetzelfde getal opleveren 
------------------------------------------------------------------------
SELECT hash_agg(* EXCLUDE(AUD_DATE_CREATED, AUD_DATE_MODIFIED, AUD_TASK_RUN_ID))  FROM VAP_PRD_VAPNL_ECP.OWNER_CC.CC_D_D_ECP_ACCOUNTS_SCD2_ALL ;
-- -1626326281736076647

SELECT hash_agg(* EXCLUDE(AUD_DATE_CREATED, AUD_DATE_MODIFIED, AUD_TASK_RUN_ID))  FROM VAP_PRD_VAPNL_ECP.OWNER_CC.CC_D_D_ECP_ACCOUNTS_SCD2_ALL_V ;
-- -1626326281736076647

------------------------------------------------------------------------