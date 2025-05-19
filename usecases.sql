cleaned_bank_churners
-- High utilization + Low income
SELECT *
FROM cleaned_bank_churners
WHERE credit_utilization > 0.5
  AND income_category IN ('Less than $40K', '$40K - $60K');

-- Churned customers with low transactions:
SELECT *
FROM cleaned_bank_churners
WHERE attrition_flag = 'Attrited Customer' AND total_trans_ct < 30;

 -- Customers With Risk Flag
SELECT *,
  CASE
    WHEN credit_utilization > 0.8 AND months_inactive_12_mon > 4 THEN 1
    ELSE 0
  END AS risk_flag
FROM cleaned_bank_churners;

-- Churned Customers With Low Transactions
SELECT *
FROM cleaned_bank_churners
WHERE attrition_flag = 'Attrited Customer'
  AND total_trans_ct < 30;


