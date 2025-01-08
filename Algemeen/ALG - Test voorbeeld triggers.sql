--------------------------------------------------------
-- ALGEMEEN
-- Voorbeeld voor triggers
--------------------------------------------------------
create or replace view ANALYSE_PMN.V_AS_JGU_D_TESTDATUMS(
	SYSTEEMDATUM,
	VERVERSDATUM
) as (SELECT TO_NUMBER(TO_CHAR(CURRENT_DATE, 'YYYYMMDD')), TO_NUMBER(TO_CHAR(CURRENT_DATE()-0, 'YYYYMMDD')) FROM DUAL);


SELECT * from ANALYSE_PMN.V_AS_JGU_D_TESTDATUMS;