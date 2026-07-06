SELECT Department,
COUNT(*) Total_Employees
FROM employees
GROUP BY Department;

SELECT Department,
AVG(MonthlyIncome)
FROM employees
GROUP BY Department;

SELECT JobRole,
COUNT(*) Attrition_Count
FROM employees
WHERE Attrition='Yes'
GROUP BY JobRole;

SELECT OverTime,
COUNT(*) Attrition_Count
FROM employees
WHERE Attrition='Yes'
GROUP BY OverTime;

SELECT Department,
ROUND(100.0 *SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)/COUNT(*),2)
AS AttritionRate
FROM employees
GROUP BY Department;
-- Total Employees
SELECT COUNT(*) AS Total_Employees
FROM hr_employee_attrition;

-- Dataset Preview
SELECT *
FROM hr_employee_attrition
LIMIT 10;

-- Total Departments
SELECT COUNT(DISTINCT Department) AS Total_Departments
FROM hr_employee_attrition;

-- Total Job Roles
SELECT COUNT(DISTINCT JobRole) AS Total_JobRoles
FROM hr_employee_attrition;

-- Distinct Education Fields
SELECT DISTINCT EducationField
FROM hr_employee_attrition;

-- Employee Count by Department
SELECT
    Department,
    COUNT(*) AS Total_Employees
FROM hr_employee_attrition
GROUP BY Department
ORDER BY Total_Employees DESC;
