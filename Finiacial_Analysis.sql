SELECT* FROM Finance_data;
--View the Data

SELECT COUNT(*) FROM Finance_data;
--Count the Number of Rows

SELECT AVG(Age) AS AverageAge, MIN(Age) AS Youngest, MAX(Age) AS Oldest
FROM Finance_data;
--Get Summary Statistics for Numerical Columns

SELECT Gender, COUNT(*) AS Count
FROM Finance_data
GROUP BY Gender;
--Count the Frequency of Categorical Values

SELECT 
    Source,
    COUNT(*) AS num_investors
FROM 
    Finance_data
GROUP BY 
    Source;
--Sources of Information for Investments

--(1)Analyzing Investment Preferences


SELECT TOP 1 Investment_Avenues, COUNT(*) AS Count
FROM Finance_data
GROUP BY Investment_Avenues
ORDER BY Count DESC;
--Determine the Most Preferred Investment Avenue:

SELECT AgeGroup, Investment_Avenues, COUNT(*) AS Count
FROM (
    SELECT *, CASE WHEN Age BETWEEN 18 AND 30 THEN '18-30'
                  WHEN Age BETWEEN 31 AND 45 THEN '31-45'
                  ELSE '46+' END AS AgeGroup
    FROM Finance_data
) AS AgeGroupedData
GROUP BY AgeGroup, Investment_Avenues
ORDER BY AgeGroup, Count DESC;
--Analyze Investment Preferences Based on Age Groups

SELECT 
    Avenue,
    COUNT(CASE WHEN Investment_Avenues = 1 THEN 1 END) AS total_investment
FROM 
    Finance_data
GROUP BY 
    Avenue;
---Total Investments of Investors in Different Categories

SELECT 
    Duration,
    COUNT(*) AS num_investors
FROM 
    Finance_data
GROUP BY 
    Duration;
---Number of Investors by Investment Duration

SELECT 
    Invest_Monitor,
    COUNT(*) AS num_investors
FROM 
    Finance_data
GROUP BY 
    Invest_Monitor;
--How Often do Investors Check Their Investments?

SELECT 
    Avenue,
    COUNT(*) AS num_investors
FROM 
    Finance_data
GROUP BY 
    Avenue;

--Distribution of Investment Routes

--(2)Investigating Investment Factors and Objectives

SELECT Factor, COUNT(*) AS Count
FROM Finance_data
GROUP BY Factor
ORDER BY Count DESC;
--Identify Key Factors Considered by Investors:

SELECT Objective, Investment_Avenues, COUNT(*) AS Count
FROM Finance_data
GROUP BY Objective, Investment_Avenues
ORDER BY Objective, Count DESC;
---Analyze Relationship Between Investment Objectives and Investment Avenues:


-- Example for Equity Investment

SELECT 
    Reason_Equity,
    COUNT(*) AS num_investors
FROM 
    Finance_data
GROUP BY 
    Reason_Equity;
---Reasons for Investment

SELECT 
    Reason_Mutual,
    COUNT(*) AS num_investors
FROM 
    Finance_data
GROUP BY 
    Reason_Mutual
ORDER BY 
    num_investors DESC;
--Most Common Reasons for Mutual Fund Investment

SELECT 
    GENDER,
    Reason_Mutual,
    COUNT(*) AS num_investors
FROM 
    Finance_data
GROUP BY 
    GENDER, Reason_Mutual;
--Reasons by Gender:

SELECT 
    What_are_your_savings_objectives,
    Reason_Mutual,
    COUNT(*) AS num_investors
FROM 
    Finance_data
GROUP BY 
    What_are_your_savings_objectives, Reason_Mutual;

--- Reasons by Investment Objective:

SELECT 
    Reason_Bonds,
    COUNT(*) AS num_investors
FROM 
    Finance_data
GROUP BY 
    Reason_Bonds
ORDER BY 
    num_investors DESC;

--- Most Common Reasons for Bond Investment

SELECT 
    CASE 
        WHEN AGE BETWEEN 18 AND 30 THEN '18-30'
        WHEN AGE BETWEEN 31 AND 45 THEN '31-45'
        ELSE '46+'
    END AS age_group,
    Reason_Bonds,
    COUNT(*) AS num_investors
FROM 
    Finance_data
GROUP BY 
    age, Reason_Bonds;

---Reasons by Age Group

SELECT 
    Avenue,
    COUNT(*) AS num_investors
FROM 
    Finance_data
GROUP BY 
    Avenue
ORDER BY 
    num_investors DESC;

---Distribution of Investment Routes

