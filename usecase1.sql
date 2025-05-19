ALTER TABLE cleaned_bank_churners
ADD COLUMN churn_flag INTEGER;

UPDATE cleaned_bank_churners
SET churn_flag = CASE
    WHEN "attrition_flag" = 'Attrited Customer' THEN 1
    ELSE 0
END;

SELECT * FROM cleaned_bank_churners;


-- Customer Count & Churn Rate
SELECT 
    COUNT(*) AS total_customers,
    SUM(churn_flag) AS churned_customers,
    ROUND(AVG(churn_flag::NUMERIC) * 100, 2) AS churn_rate_percent
FROM cleaned_bank_churners;

-- Churn Rate by Income Group
SELECT 
    income_category,
    COUNT(*) AS total,
    SUM(churn_flag) AS churned,
    ROUND(AVG(churn_flag::NUMERIC) * 100, 2) AS churn_rate
FROM cleaned_bank_churners
GROUP BY income_category
ORDER BY churn_rate DESC;

-- Churn Rate by Credit Card Type
SELECT 
    card_category,
    COUNT(*) AS total,
    SUM(churn_flag) AS churned,
    ROUND(AVG(churn_flag::NUMERIC) * 100, 2) AS churn_rate
FROM cleaned_bank_churners
GROUP BY card_category
ORDER BY churn_rate DESC;

-- Churn by Credit Utilization 
SELECT 
    credit_utilization,
    COUNT(*) AS total,
    SUM(churn_flag) AS churned,
    ROUND(AVG(churn_flag::NUMERIC) * 100, 2) AS churn_rate
FROM cleaned_bank_churners
GROUP BY credit_utilization
ORDER BY churn_rate DESC;


-- Churn by Tenure Bucket (Customer Age Group)
SELECT 
    CASE 
        WHEN customer_age BETWEEN 20 AND 30 THEN '20–30'
        WHEN customer_age BETWEEN 31 AND 50 THEN '31–50'
        ELSE '51+'
    END AS age_group,
    COUNT(*) AS total,
    SUM(churn_flag) AS churned,
    ROUND(AVG(churn_flag::NUMERIC) * 100, 2) AS churn_rate
FROM cleaned_bank_churners
GROUP BY age_group
ORDER BY churn_rate DESC;

 -- Average Transactions by Marital Status
SELECT 
    Marital_Status,
    ROUND(AVG(Total_Trans_Ct), 2) AS avg_transactions
FROM cleaned_bank_churners
GROUP BY Marital_Status;

--  High Risk Customers (Utilization > 70%)
SELECT *
FROM cleaned_bank_churners
WHERE Avg_Utilization_Ratio > 0.7
ORDER BY Avg_Utilization_Ratio DESC
limit 5;

-- Top 10 Most Engaged Customers
SELECT 
	clientnum,
    Total_Trans_Ct,
    Contacts_Count_12_mon,
    (Total_Trans_Ct + Contacts_Count_12_mon) AS engagement_score
FROM cleaned_bank_churners
ORDER BY engagement_score DESC
LIMIT 10;







