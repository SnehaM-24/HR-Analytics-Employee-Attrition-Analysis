-- Employees Earning Above Their Department's Average Salary
SELECT
    EmployeeNumber,
    Department,
    JobRole,
    MonthlyIncome
FROM hr_employee_attrition h1
WHERE MonthlyIncome >
(
    SELECT AVG(MonthlyIncome)
    FROM hr_employee_attrition h2
    WHERE h1.Department = h2.Department
)
ORDER BY Department, MonthlyIncome DESC;

-- Department-wise Average Job Satisfaction
SELECT
    Department,
    ROUND(AVG(JobSatisfaction),2) AS Avg_Job_Satisfaction
FROM hr_employee_attrition
GROUP BY Department
ORDER BY Avg_Job_Satisfaction DESC;

-- Department-wise Average Work-Life Balance
SELECT
    Department,
    ROUND(AVG(WorkLifeBalance),2) AS Avg_WorkLifeBalance
FROM hr_employee_attrition
GROUP BY Department
ORDER BY Avg_WorkLifeBalance DESC;

-- Salary Band Distribution
SELECT
    CASE
        WHEN MonthlyIncome < 5000 THEN 'Low Salary'
        WHEN MonthlyIncome BETWEEN 5000 AND 10000 THEN 'Medium Salary'
        ELSE 'High Salary'
    END AS Salary_Band,

    COUNT(*) AS Total_Employees

FROM hr_employee_attrition

GROUP BY Salary_Band
ORDER BY Total_Employees DESC;

-- Overtime vs Average Monthly Income
SELECT
    OverTime,
    ROUND(AVG(MonthlyIncome),2) AS Average_Salary
FROM hr_employee_attrition
GROUP BY OverTime;

-- Employees with More Than 15 Years at the Company
SELECT
    EmployeeNumber,
    Department,
    JobRole,
    YearsAtCompany
FROM hr_employee_attrition
WHERE YearsAtCompany > 15
ORDER BY YearsAtCompany DESC;

-- Top 5 Departments by Average Salary
SELECT
    Department,
    ROUND(AVG(MonthlyIncome),2) AS Average_Salary
FROM hr_employee_attrition
GROUP BY Department
ORDER BY Average_Salary DESC
LIMIT 5;

-- Rank Departments by Average Salary (Window Function)
SELECT
    Department,
    ROUND(AVG(MonthlyIncome),2) AS Average_Salary,

    DENSE_RANK() OVER(
        ORDER BY AVG(MonthlyIncome) DESC
    ) AS Salary_Rank

FROM hr_employee_attrition

GROUP BY Department;

-- Top 10 Most Experienced Employees
SELECT
    EmployeeNumber,
    Department,
    JobRole,
    TotalWorkingYears
FROM hr_employee_attrition
ORDER BY TotalWorkingYears DESC
LIMIT 10;

-- Department-wise Attrition Percentage
SELECT
    Department,
    COUNT(CASE WHEN Attrition='Yes' THEN 1 END) AS Employees_Left,
    COUNT(*) AS Total_Employees,
    ROUND(
        COUNT(CASE WHEN Attrition='Yes' THEN 1 END) * 100.0 /
        COUNT(*),
        2
    ) AS Attrition_Percentage
FROM hr_employee_attrition
GROUP BY Department
ORDER BY Attrition_Percentage DESC;

-- Top 5 Job Roles with Highest Attrition
SELECT
    JobRole,
    COUNT(*) AS Employees_Left
FROM hr_employee_attrition
WHERE Attrition='Yes'
GROUP BY JobRole
ORDER BY Employees_Left DESC
LIMIT 5;

-- Average Salary by Education Field
SELECT
    EducationField,
    ROUND(AVG(MonthlyIncome),2) AS Average_Salary
FROM hr_employee_attrition
GROUP BY EducationField
ORDER BY Average_Salary DESC;

-- Overtime Percentage
SELECT
    OverTime,
    COUNT(*) AS Employees,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM hr_employee_attrition),
        2
    ) AS Percentage
FROM hr_employee_attrition
GROUP BY OverTime;

-- Department-wise Average Age
SELECT
    Department,
    ROUND(AVG(Age),2) AS Average_Age
FROM hr_employee_attrition
GROUP BY Department
ORDER BY Average_Age DESC;

-- Attrition Percentage by Job Role
SELECT
    JobRole,
    COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS Employees_Left,
    COUNT(*) AS Total_Employees,
    ROUND(
        COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 /
        COUNT(*),
        2
    ) AS Attrition_Percentage
FROM hr_employee_attrition
GROUP BY JobRole
ORDER BY Attrition_Percentage DESC;

-- Average Monthly Income by Gender and Department
SELECT
    Department,
    Gender,
    ROUND(AVG(MonthlyIncome),2) AS Average_Salary
FROM hr_employee_attrition
GROUP BY Department, Gender
ORDER BY Department, Average_Salary DESC;
 
-- Employees with High Salary and High Job Satisfaction
SELECT
    EmployeeNumber,
    Department,
    JobRole,
    MonthlyIncome,
    JobSatisfaction
FROM hr_employee_attrition
WHERE MonthlyIncome >
(
    SELECT AVG(MonthlyIncome)
    FROM hr_employee_attrition
)
AND JobSatisfaction >= 3
ORDER BY MonthlyIncome DESC;

-- Average Work-Life Balance by Department
SELECT
    Department,
    ROUND(AVG(WorkLifeBalance),2) AS Average_WorkLife_Balance
FROM hr_employee_attrition
GROUP BY Department
ORDER BY Average_WorkLife_Balance DESC;

-- Department Performance Summary
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    ROUND(AVG(MonthlyIncome),2) AS Avg_Salary,
    ROUND(AVG(JobSatisfaction),2) AS Avg_Job_Satisfaction,
    ROUND(AVG(EnvironmentSatisfaction),2) AS Avg_Environment_Satisfaction,
    ROUND(AVG(WorkLifeBalance),2) AS Avg_WorkLife_Balance
FROM hr_employee_attrition
GROUP BY Department
ORDER BY Total_Employees DESC; 