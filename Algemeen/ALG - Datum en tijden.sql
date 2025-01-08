--------------------------------------------------------
-- Kalender met allerlei datum en tijd varianten
--------------------------------------------------------

SELECT ID,
DY_DATE,
DY_NR_CONT,
DY_NL_WORK_DAY_WITHIN_MONTH_NR,
DY_NL_WORK_DAY_WITHIN_MONTH_UQ,
DY_NL_WORK_DAY_WITHIN_YEAR_NR,
DY_NL_WORK_DAY_WITHIN_YEAR_UQ,
DY_NL_WORK_DAY_NR_CONT,
DY_NL_WORK_DAY_IND,
DY_NL_HOLIDAY_NM,
DY_WEEKDAY_NM,
DY_WEEKDAY_NM_LONG,
DY_WEEKDAY_NR,
DY_DAY_WITHIN_MONTH_NR,
DY_DAY_WITHIN_MONTH_NR_NM,
DY_DAY_WITHIN_YEAR_NR,
DY_DAY_WITHIN_YEAR_NR_NM,
DY_WEEKEND_IND,
DY_LAST_OF_MONTH_IND,
IW_NR_CONT,
IW_START_DATE,
IW_END_DATE,
IW_YEAR_WEEK,
IW_WEEK_WITHIN_YEAR_NR,
IW_WEEK_WITHIN_YEAR_NR_NM,
IY_YEAR,
IY_START_DATE,
IY_NL_WORK_DAYS_N,
MO_YEAR_MONTH_NR,
MO_START_DATE,
MO_END_DATE,
MO_MONTH_NM,
MO_MONTH_NM_LONG,
MO_MONTH_WITHIN_YEAR_NR,
MO_MONTH_WITHIN_YEAR_NR_NM,
MO_MONTH_NR_CONT,
MO_NL_WORK_DAYS_N,
WM_YEAR_MONTH_NR,
WM_START_DATE,
WM_END_DATE,
WM_MONTH_NM,
WM_MONTH_NM_LONG,
WM_MONTH_WITHIN_YEAR_NR,
WM_MONTH_WITHIN_YEAR_NR_NM,
WM_MONTH_NR_CONT,
WM_NL_WORK_DAYS_N,
QR_START_DATE,
QR_YEAR_QUARTER_NR,
QR_END_DATE,
QR_QUARTER_WITHIN_YEAR_NR,
QR_QUARTER_NR_CONT,
QR_NL_WORK_DAYS_N,
YR_YEAR,
YR_NL_WORK_DAYS_N
FROM OWNER_CDS.CDSDY_D_D_CALENDAR_DAYS
WHERE 1=1
--AND ID >= 20220101
AND ID BETWEEN 20230501 AND 20230605
ORDER BY ID
--LIMIT 1000
;



--------------------------------------------------------
-- Vorige en volgende DAG bepalen
--------------------------------------------------------
WITH VORIGE_VOLGENDE_DAG
     AS (SELECT ID
                , LAG(ID)
                    OVER (
                      ORDER BY ID) AS vorige
                , LEAD(ID)
                    OVER (
                      ORDER BY ID) AS volgende
         FROM   OWNER_CDS.CDSDY_D_D_CALENDAR_DAYS)
SELECT *
FROM   VORIGE_VOLGENDE_DAG
WHERE  1 = 1
       --AND ID = to_char(current_date() , 'YYYYMMDD')
       AND ID = 20230602
;

--------------------------------------------------------
-- Vorige en volgende WERKDAG bepalen
--------------------------------------------------------
WITH VORIGE_VOLGENDE_WERKDAG
     AS (SELECT ID
                , LAG(ID)
                    OVER (
                      ORDER BY ID) AS vorige
                , LEAD(ID)
                    OVER (
                      ORDER BY ID) AS volgende
         FROM   OWNER_CDS.CDSDY_D_D_CALENDAR_DAYS
         WHERE  1=1
                AND DY_NL_WORK_DAY_IND = 'Y')
SELECT *
FROM   VORIGE_VOLGENDE_WERKDAG
WHERE  1 = 1
       --AND ID = to_char(current_date() , 'YYYYMMDD')
       AND ID = 20230529
;
       
--------------------------------------------------------
-- Vorige WERKDAG bepalen (met wat extra info)
--------------------------------------------------------
WITH BASIS
     AS (SELECT ID
                , DY_WEEKDAY_NM_LONG     AS DAG
                , DY_NL_WORK_DAY_NR_CONT AS HUIDIG
                , DY_NL_WORK_DAY_IND AS WERKDAG_IND
                , CASE
                    WHEN DY_NL_WORK_DAY_IND = 'Y' THEN DY_NL_WORK_DAY_NR_CONT - 1
                    ELSE DY_NL_WORK_DAY_NR_CONT
                  END                    VORIGE
         FROM   OWNER_CDS.CDSDY_D_D_CALENDAR_DAYS
         WHERE  1 = 1
            AND ID BETWEEN 20230501 AND 20230605
        --  AND ID = to_char(current_date() , 'YYYYMMDD')
        )
SELECT BASIS.ID
       , BASIS.DAG
       , BASIS.WERKDAG_IND
       , BASIS.HUIDIG
       , BASIS.VORIGE
       , RES.ID
       , RES.DY_WEEKDAY_NM_LONG
       , RES.DY_NL_WORK_DAY_NR_CONT
FROM   OWNER_CDS.CDSDY_D_D_CALENDAR_DAYS RES
       JOIN BASIS
         ON RES.DY_NL_WORK_DAY_NR_CONT = BASIS.VORIGE
WHERE  RES.DY_NL_WORK_DAY_IND = 'Y'
ORDER BY BASIS.ID; 

--------------------------------------------------------
-- Vorige WERKDAG bepalen (kort
--------------------------------------------------------
WITH BASIS
     AS (SELECT CASE
                    WHEN DY_NL_WORK_DAY_IND = 'Y' THEN DY_NL_WORK_DAY_NR_CONT - 1
                    ELSE DY_NL_WORK_DAY_NR_CONT
                  END                    VORIGE
         FROM   OWNER_CDS.CDSDY_D_D_CALENDAR_DAYS
         WHERE  ID = to_char(current_date() , 'YYYYMMDD')
        )
SELECT RES.ID
FROM   OWNER_CDS.CDSDY_D_D_CALENDAR_DAYS RES
       JOIN BASIS
         ON RES.DY_NL_WORK_DAY_NR_CONT = BASIS.VORIGE
WHERE  RES.DY_NL_WORK_DAY_IND = 'Y';

--------------------------------------------------------
-- Vorige WERKDAG bepalen (kort)
--------------------------------------------------------
SELECT
	RES.ID
FROM
	OWNER_CDS.CDSDY_D_D_CALENDAR_DAYS RES,
	(
	SELECT
		CASE
			WHEN DY_NL_WORK_DAY_IND = 'Y' THEN DY_NL_WORK_DAY_NR_CONT - 1
			ELSE DY_NL_WORK_DAY_NR_CONT
		END VORIGE
	FROM
		OWNER_CDS.CDSDY_D_D_CALENDAR_DAYS
	WHERE
		ID = to_char(current_date() ,
		'YYYYMMDD')
         ) BASIS
WHERE
	RES.DY_NL_WORK_DAY_NR_CONT = BASIS.VORIGE
	AND RES.DY_NL_WORK_DAY_IND = 'Y';

--------------------------------------------------------
--CREATE TABLE table_of_2_years_date_times AS
--------------------------------------------------------
SELECT 
    date_time::date as date,
    date_time::time as time
FROM (
    SELECT 
        row_number() over (order by null)-1 as rn
        ,dateadd('minute', 5 * rn, '2022-09-01'::date) as date_time -- 5 = interval van 5 minuten gewenst
    from table(generator(rowcount=>12*24*365*2)) -- 12 = aantal 5 minuten in 1 uur; 24 = aantal uren in 1 dag; 365 = aantal dagen in 1 jaar; 2 = hoeveel jaar gewenst
)
ORDER BY rn
;