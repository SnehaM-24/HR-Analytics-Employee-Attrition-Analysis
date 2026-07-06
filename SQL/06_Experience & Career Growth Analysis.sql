-- Average Total Working Years
SELECT
    ROUND(AVG(TotalWorkingYears),2) AS Average_Working_Years
FROM hr_employee_attrition;

-- Average Years at Company by Department
SELECT
    Department,
    ROUND(AVG(YearsAtCompany),2) AS Average_Years_At_Company
FROM hr_employee_attrition
GROUP BY Department
ORDER BY Average_Years_At_Company DESC;

-- Average Years in Current Role
SELECT
    JobRole,
    ROUND(AVG(YearsInCurrentRole),2) AS Average_Years_In_Current_Role
FROM hr_employee_attrition
GROUP BY JobRole
ORDER BY Average_Years_In_Current_Role DESC;

-- Average Years Since Last Promotion
SELECT
    Department,
    ROUND(AVG(YearsSinceLastPromotion),2) AS Avg_Years_Since_Last_Promotion
FROM hr_employee_attrition
GROUP BY Department
ORDER BY Avg_Years_Since_Last_Promotion DESC;

-- Average Years with Current Manager
SELECT
    Department,
    ROUND(AVG(YearsWithCurrManager),2) AS Avg_Years_With_Manager
FROM hr_employee_attrition
GROUP BY Department
ORDER BY Avg_Years_With_Manager DESC;

-- Attrition by Experience Group
SELECT
    CASE
        WHEN TotalWorkingYears < 5 THEN '0-4 Years'
        WHEN TotalWorkingYears BETWEEN 5 AND 10 THEN '5-10 Years'
        WHEN TotalWorkingYears BETWEEN 11 AND 20 THEN '11-20 Years'
        ELSE '20+ Years'
    END AS Experience_Group,

    COUNT(*) AS Employees_Left

FROM hr_employee_attrition

WHERE Attrition = 'Yes'

GROUP BY Experience_Group

ORDER BY Employees_Left DESC;

-- Attrition by Years Since Last Promotion
SELECT
    YearsSinceLastPromotion,
    COUNT(*) AS Employees_Left
FROM hr_employee_attrition
WHERE Attrition = 'Yes'
GROUP BY YearsSinceLastPromotion
ORDER BY YearsSinceLastPromotion;

-- Attrition by Years at Company
SELECT
    YearsAtCompany,
    COUNT(*) AS Employees_Left
FROM hr_employee_attrition
WHERE Attrition = 'Yes'
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;