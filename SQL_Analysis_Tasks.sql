-- FIFA 21 PORTFOLIO PROJECT - SQL ANALYSIS
-- Author: Nasos
-- Date: 2026
-- Description: Analyzing player data to find insights on value, wages, and performance.
-- =============================================

ALTER TABLE fifa21_cleaned RENAME COLUMN "↓OVA" TO OVA;


-- TOP PLAYERS ANALYSIS

SELECT 
    Name, 
    Age, 
    Club, 
    OVA,
    "Best Position"
FROM fifa21_cleaned
ORDER BY OVA DESC 
LIMIT 10;


-- FINANCIAL CHECK 

SELECT 
    Name,
    Value_Num_in_EUR ,
    Wage_Num_in_EUR 
FROM fifa21_cleaned
ORDER BY Value_Num_in_EUR DESC 
LIMIT 5;


SELECT 
    Name,
    Value_Num_in_EUR ,
    Wage_Num_in_EUR 
FROM fifa21_cleaned
ORDER BY Wage_Num_in_EUR DESC 
LIMIT 20;

--INVESTIGATING : Checking Cristiano Ronaldo's data

SELECT 
    Name, 
    Club, 
    Age,
    OVA,
    Wage_Num_in_EUR, 
    Value_Num_in_EUR
FROM fifa21_cleaned
WHERE Name LIKE '%Cristiano Ronaldo%';

-- IDENTIFYING THE MOST VALUABLE PLAYER FOR EACH POSITION

WITH RankedPlayers AS (
    SELECT 
        Name,
        Club,
        "Best Position",
        Value_Num_in_EUR,
        RANK() OVER (PARTITION BY "Best Position" ORDER BY Value_Num_in_EUR DESC) as RANK 
    FROM  fifa21_cleaned
)    
   SELECT 
    Name,
    "Best Position", 
    Club, 
    Value_Num_in_EUR
FROM RankedPlayers
WHERE RANK = 1
ORDER BY Value_Num_in_EUR DESC;

-- TEAM PERFORMANCE ANALYSIS
SELECT
    Club,
    ROUND(AVG(OVA), 2) as Average_Rating
FROM fifa21_cleaned
GROUP BY Club 
ORDER BY Average_Rating DESC 
LIMIT 10;

-- STATISTICAL / DISTRIBUTION ANALYSIS
SELECT 
    CASE 
        WHEN OVA >= 90 THEN '1 Elite (90+)'
        WHEN OVA BETWEEN 80 AND 89 THEN '2 Top Class (80-89)'
        WHEN OVA BETWEEN 70 AND 79 THEN '3 Professional (70-79)'
        WHEN OVA BETWEEN 60 AND 69 THEN '4 Average (60-69)'
        WHEN OVA BETWEEN 50 AND 59 THEN '5 Below Average (50-59)'
        ELSE '6 Amateur (<50)'
    END as Player_Category,
    COUNT(Name) as Total_Players,
    ROUND(AVG(Value_Num_in_EUR), 0) as Avg_Market_Value,
    ROUND(AVG(Wage_Num_in_EUR), 0) as Avg_Wage
FROM fifa21_cleaned
GROUP BY Player_Category
ORDER BY Player_Category;

  























