SELECT * FROM VAP_PRD_VAPNL_ECP.PROCESS_INFO.JOB_STATUS
WHERE 1=1
AND UPPER(JOB_NAME) LIKE 'HUBP094%'
AND START_DATE > current_date() - 60
ORDER BY START_DATE ;