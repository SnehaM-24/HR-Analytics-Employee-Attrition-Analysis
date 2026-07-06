-- Job Satisfaction Distribution
SELECT
    JobSatisfaction,
    COUNT(*) AS Total_Employees
FROM hr_employee_attrition
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

-- Job Satisfaction vs Attrition
SELECT
    JobSatisfaction,
    COUNT(*) AS Employees_Left
FROM hr_employee_attrition
WHERE Attrition = 'Yes'
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

-- Environment Satisfaction Distribution
SELECT
    EnvironmentSatisfaction,
    COUNT(*) AS Total_Employees
FROM hr_employee_attrition
GROUP BY EnvironmentSatisfaction
ORDER BY EnvironmentSatisfaction;

-- Environment Satisfaction vs Attrition
SELECT
    EnvironmentSatisfaction,
    COUNT(*) AS Employees_Left
FROM hr_employee_attrition
WHERE Attrition = 'Yes'
GROUP BY EnvironmentSatisfaction
ORDER BY EnvironmentSatisfaction;

-- Work-Life Balance Distribution
SELECT
    WorkLifeBalance,
    COUNT(*) AS Total_Employees
FROM hr_employee_attrition
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;

-- Work-Life Balance vs Attrition
SELECT
    WorkLifeBalance,
    COUNT(*) AS Employees_Left
FROM hr_employee_attrition
WHERE Attrition = 'Yes'
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;

-- Performance Rating Distribution
SELECT
    PerformanceRating,
    COUNT(*) AS Total_Employees
FROM hr_employee_attrition
GROUP BY PerformanceRating
ORDER BY PerformanceRating;

-- Relationship Satisfaction Analysis
SELECT
    RelationshipSatisfaction,
    COUNT(*) AS Total_Employees
FROM hr_employee_attrition
GROUP BY RelationshipSatisfaction
ORDER BY RelationshipSatisfaction;

-- Training Times Last Year
SELECT
    TrainingTimesLastYear,
    COUNT(*) AS Total_Employees
FROM hr_employee_attrition
GROUP BY TrainingTimesLastYear
ORDER BY TrainingTimesLastYear;