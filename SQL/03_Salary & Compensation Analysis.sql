-- Average Monthly Salary
SELECT
    ROUND(AVG(MonthlyIncome),2) AS Average_Monthly_Salary
FROM hr_employee_attrition;

-- Average Salary by Department
SELECT
    Department,
    ROUND(AVG(MonthlyIncome), 2) AS Average_Salary
FROM hr_employee_attrition
GROUP BY Department
ORDER BY Average_Salary DESC;

-- Average Salary by Job Role
SELECT
    JobRole,
    ROUND(AVG(MonthlyIncome),2) AS Average_Salary
FROM hr_employee_attrition
GROUP BY JobRole
ORDER BY Average_Salary DESC;

-- Average Salary by Job Role
SELECT
    JobRole,
    ROUND(AVG(MonthlyIncome),2) AS Average_Salary
FROM hr_employee_attrition
GROUP BY JobRole
ORDER BY Average_Salary DESC;

-- Highest Paid Employees (Top 10)
SELECT
    EmployeeNumber,
    JobRole,
    Department,
    MonthlyIncome
FROM hr_employee_attrition
ORDER BY MonthlyIncome DESC
LIMIT 10;

-- Lowest Paid Employees (Top 10)
SELECT
    EmployeeNumber,
    JobRole,
    Department,
    MonthlyIncome
FROM hr_employee_attrition
ORDER BY MonthlyIncome ASC
LIMIT 10;

-- Employees Earning Above Average Salary
SELECT
    EmployeeNumber,
    JobRole,
    Department,
    MonthlyIncome
FROM hr_employee_attrition
WHERE MonthlyIncome >
(
    SELECT AVG(MonthlyIncome)
    FROM hr_employee_attrition
)
ORDER BY MonthlyIncome DESC;

-- Salary Category using CASE
SELECT
    EmployeeNumber,
    JobRole,
    MonthlyIncome,

    CASE
        WHEN MonthlyIncome < 5000 THEN 'Low Salary'
        WHEN MonthlyIncome BETWEEN 5000 AND 10000 THEN 'Medium Salary'
        ELSE 'High Salary'
    END AS Salary_Category

FROM hr_employee_attrition;