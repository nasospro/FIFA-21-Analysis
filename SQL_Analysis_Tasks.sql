-- FIFA 21 PORTFOLIO PROJECT - SQL ANALYSIS
-- Author: Nasos
-- Date: 2026
-- Description: Analyzing player data to find insights on value, wages, and performance.
-- =============================================

-- TOP PLAYERS ANALYSIS
-- Finding the top 10 players based on Overall Rating (OVA) to identify star talents.
ALTER TABLE fifa21_cleaned RENAME COLUMN "↓OVA" TO OVA;


SELECT 
    Name, 
    Age, 
    Club, 
    OVA,
    "Best Position"
FROM fifa21_cleaned
ORDER BY OVA DESC 
LIMIT 10;