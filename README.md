***<h3>Financial Data Analysis using SQL</h3>***

**Introduction**
This repository contains SQL queries designed to analyze a dataset related to financial data. The queries aim to provide insights into investor behavior, investment preferences, and factors influencing investment decisions

***Data Overview***

***Data Source***:</br> The data was gotten from https://www.kaggle.com/code/emremsr/finance-data#Reason_Mutual
***Data Description**: 
The dataset contains information about financial investors, including their gender, age, investment preferences, and reasons for investing in various asset classes. Key columns include:
<ul>Gender</ul>
<ul>Age</ul>
<ul>Investment_Avenues</ul>
<ul>Mutual_Funds</ul>
<ul>Equity_Market</ul>
<ul>Debentures</ul>
<ul>Government_Bonds</ul>
<ul>Fixed_Deposits</ul>
<ul>PPF</ul>
<ul>Gold</ul>
<ul>Duration</ul>
<ul>Invest_Monitor</ul>
<ul>Expect</ul>
<ul>Avenue</ul>
<ul>What_are_your_savings_objectives?</ul>
<ul>Reason_Equity</ul>
<ul>Reason_Mutual</ul>
<ul>Reason_Bonds</ul>
<ul>Reason_FD</ul>
<ul>Source</ul>

***Analysis Goals***
<ul>Investment Preferences</ul>
<ul>Determine the most preferred investment avenues.</ul>
<ul>Analyze investment preferences based on age groups.</ul>
<ul>Evaluate the total investments in different categories.</ul>
<ul>Investment Factors and Objectives</ul>
<ul>Identify key factors considered by investors.</ul>
<ul>Analyze the relationship between investment objectives and investment avenues.</ul>
<ul>Investigate reasons for investing in specific asset classes (equity, mutual funds, bonds).</ul>

***SQL Queries***
<li>1. Data Exploration:</li>

View the data: SELECT * FROM Finance_data;
Count the number of rows: SELECT COUNT(*) FROM Finance_data;
Get summary statistics: SELECT AVG(Age) AS AverageAge, MIN(Age) AS Youngest, MAX(Age) AS Oldest FROM Finance_data;
Count the frequency of categorical values: SELECT Gender, COUNT(*) AS Count FROM Finance_data GROUP BY Gender;
<li>2. Investment Preferences:</li>

Most preferred investment avenue: SELECT TOP 1 Investment_Avenues, COUNT(*) AS Count FROM Finance_data GROUP BY Investment_Avenues ORDER BY Count DESC;
Investment preferences by age group: SELECT AgeGroup, Investment_Avenues, COUNT(*) AS Count FROM (SELECT *, CASE WHEN Age BETWEEN 18 AND 30 THEN '18-30' WHEN Age BETWEEN 31 AND 45 THEN '31-45' ELSE '46+' END AS AgeGroup FROM Finance_data) AS AgeGroupedData GROUP BY AgeGroup, Investment_Avenues ORDER BY AgeGroup, Count DESC;
Total investments in different categories: SELECT Avenue, COUNT(CASE WHEN Investment_Avenues = 1 THEN 1 END) AS total_investment FROM Finance_data GROUP BY Avenue;
<li>3. Investment Factors and Objectives:</li>

Key factors considered by investors: SELECT Factor, COUNT(*) AS Count FROM Finance_data GROUP BY Factor ORDER BY Count DESC;
Relationship between investment objectives and investment avenues: SELECT Objective, Investment_Avenues, COUNT(*) AS Count FROM Finance_data GROUP BY Objective, Investment_Avenues ORDER BY Objective, Count DESC;
Reasons for investing in equity: SELECT Reason_Equity, COUNT(*) AS num_investors FROM Finance_data GROUP BY Reason_Equity;
Reasons for investing in mutual funds: SELECT Reason_Mutual, COUNT(*) AS num_investors FROM Finance_data GROUP BY Reason_Mutual ORDER BY num_investors DESC;
Reasons for investing in bonds: SELECT Reason_Bonds, COUNT(*) AS num_investors FROM Finance_data GROUP BY Reason_Bonds ORDER BY num_investors DESC;



***Results and Insights***<br>
Summary of Key Findings from the Financial Data Analysis
Most Preferred Investment Avenue: The most popular investment avenue among respondents was Mutual Funds.
Age-Based Preferences:
Younger investors (18-30) were more likely to choose Mutual Funds.
Older investors (31-45) tended to prefer Mutual Fund.
Investors over 46 showed a preference for None.
Total Investments: The total amount invested in each category varied, with 18-30 having the highest total investment.

***Investment Factors and Objectives***:
Key Factors: The most important factors considered by investors were Returns
Investment Objectives and Avenues: The relationship between investment objectives and investment avenues was complex. For example, investors seeking Retirement Plan often chose Mutual Fund.
Reasons for Investing:
Equity: The most common reasons for investing in equity were Capital Appreciation.
Mutual Funds: The most common reasons for investing in mutual funds were Retirement Plan.
Bonds: The most common reasons for investing in bonds were Assured returns.
Additional Insights:
Investment Duration: Investors typically held their investments for 3-5 years.
Investment Monitoring: Most investors checked their investments Monthly.

***Note***: These findings are based on the provided SQL queries and the assumptions made about the data. The actual results may vary depending on the specific data used and the interpretation of the findings.
