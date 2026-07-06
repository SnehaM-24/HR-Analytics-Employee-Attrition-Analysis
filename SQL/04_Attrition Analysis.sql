-- Total Employees Who Left
SELECT
    COUNT(*) AS Total_Attrition
FROM hr_employee_attrition
WHERE Attrition = 'Yes';

-- Overall Attrition Rate
SELECT
    ROUND(
        (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) /
        COUNT(*),
        2
    ) AS Attrition_Rate_Percentage
FROM hr_employee_attrition;

-- Gender-wise Attrition
SELECT
    Gender,
    COUNT(*) AS Employees_Left
FROM hr_employee_attrition
WHERE Attrition = 'Yes'
GROUP BY Gender
ORDER BY Employees_Left DESC;

-- Education-wise Attrition
SELECT
    Education,
    COUNT(*) AS Employees_Left
FROM hr_employee_attrition
WHERE Attrition = 'Yes'
GROUP BY Education
ORDER BY Employees_Left DESC;

-- Business Travel vs Attrition
SELECT
    BusinessTravel,
    COUNT(*) AS Employees_Left
FROM hr_employee_attrition
WHERE Attrition = 'Yes'
GROUP BY BusinessTravel
ORDER BY Employees_Left DESC;

-- Marital Status vs Attrition
SELECT
    MaritalStatus,
    COUNT(*) AS Employees_Left
FROM hr_employee_attrition
WHERE Attrition = 'Yes'
GROUP BY MaritalStatus
ORDER BY Employees_Left DESC;

-- Age Group vs Attrition
SELECT
    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Age BETWEEN 40 AND 49 THEN '40-49'
        ELSE '50+'
    END AS Age_Group,

    COUNT(*) AS Employees_Left

FROM hr_employee_attrition

WHERE Attrition = 'Yes'

GROUP BY Age_Group

ORDER BY Employees_Left DESC;

-- Attrition by Job Level
SELECT
    JobLevel,
    COUNT(*) AS Employees_Left
FROM hr_employee_attrition
WHERE Attrition = 'Yes'
GROUP BY JobLevel
ORDER BY JobLevel;