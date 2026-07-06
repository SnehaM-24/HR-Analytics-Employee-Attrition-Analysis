-- Employees by Gender
SELECT
    Gender,
    COUNT(*) AS Total_Employees
FROM hr_employee_attrition
GROUP BY Gender
ORDER BY Total_Employees DESC;

-- Employees by Marital Status
SELECT
    MaritalStatus,
    COUNT(*) AS Total_Employees
FROM hr_employee_attrition
GROUP BY MaritalStatus
ORDER BY Total_Employees DESC;

-- Employees by Education Level
SELECT
    Education,
    COUNT(*) AS Total_Employees
FROM hr_employee_attrition
GROUP BY Education
ORDER BY Education;

-- Employees by Business Travel
SELECT
    BusinessTravel,
    COUNT(*) AS Total_Employees
FROM hr_employee_attrition
GROUP BY BusinessTravel
ORDER BY Total_Employees DESC;

 -- Employees by Age Group
 SELECT
    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Age BETWEEN 40 AND 49 THEN '40-49'
        ELSE '50+'
    END AS Age_Group,
    COUNT(*) AS Total_Employees
FROM hr_employee_attrition
GROUP BY Age_Group
ORDER BY Total_Employees DESC;