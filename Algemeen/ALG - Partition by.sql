------------------------------------------------------------------------
-- 'Partition by' voorbeelden
------------------------------------------------------------------------
        
------------------------------------------------------------------------
-- Selecteer alleen 1 regel waarbij de oudste datum voorkomt
------------------------------------------------------------------------
SELECT *
FROM   (SELECT INTERACTION_ID
               , SNAPSHOT_DCDY_ID
               , ROW_NUMBER()
                   OVER (
                     PARTITION BY INTERACTION_ID
                     ORDER BY SNAPSHOT_DCDY_ID ASC) AS ROWNUMBER
        FROM   VAP_PRD_VAPNL_ECP.OWNER_CC.CC_D_F_ROUTINGS_IN_BACKLOG FRIB
        WHERE  INTERACTION_ID = 451203512) A
WHERE  ROWNUMBER = 1
;

------------------------------------------------------------------------
-- Bij iedere resultaat regel staan in een aparte kolommen de actuele, oudste en jongste datum
------------------------------------------------------------------------
SELECT INTERACTION_ID
      , SNAPSHOT_DCDY_ID
       , FIRST_VALUE(SNAPSHOT_DCDY_ID)
           OVER (
             PARTITION BY INTERACTION_ID
             ORDER BY SNAPSHOT_DCDY_ID ASC) oudste_datum
       , FIRST_VALUE(SNAPSHOT_DCDY_ID)
           OVER (
             PARTITION BY INTERACTION_ID
             ORDER BY SNAPSHOT_DCDY_ID DESC) jongste_datum
       , ROW_NUMBER() OVER (PARTITION BY INTERACTION_ID
                     ORDER BY SNAPSHOT_DCDY_ID ASC) regelnummer
FROM   VAP_PRD_VAPNL_ECP.OWNER_CC.CC_D_F_ROUTINGS_IN_BACKLOG FRIB
WHERE  1=1
AND INTERACTION_ID = 451203512
ORDER BY regelnummer
;

