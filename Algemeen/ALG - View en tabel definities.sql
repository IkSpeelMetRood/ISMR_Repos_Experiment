------------------------------------------------------------------------------
-- Overzicht van alle TABELLEN / VIEWS / VELDEN in een schema
------------------------------------------------------------------------------
SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'ANALYSE_PMN' ORDER BY TABLE_SCHEMA , TABLE_NAME;
SELECT VIEW_DEFINITION FROM INFORMATION_SCHEMA.VIEWS WHERE TABLE_SCHEMA = 'ANALYSE_PMN' ORDER BY TABLE_SCHEMA , TABLE_NAME;
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'ANALYSE_PMN' ORDER BY TABLE_SCHEMA , TABLE_NAME, COLUMN_NAME;
------------------------------------------------------------------------------

-- Lijst van alle schema's in de database
SHOW SCHEMAS;

-- Lijst van alle tabellen in een specifiek schema
SHOW TABLES IN SCHEMA ANALYSE_PMN;

------------------------------------------------------------------------------