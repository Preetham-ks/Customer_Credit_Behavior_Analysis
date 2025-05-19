CREATE TABLE cleaned_bank_churners (
    clientnum BIGINT PRIMARY KEY,
    attrition_flag TEXT,
    customer_age INT,
    gender TEXT,
    dependent_count INT,
    education_level TEXT,
    marital_status TEXT,
    income_category TEXT,
    card_category TEXT,
    months_on_book INT,
    total_relationship_count INT,
    months_inactive_12_mon INT,
    contacts_count_12_mon INT,
    credit_limit FLOAT,
    total_revolving_bal INT,
    avg_open_to_buy FLOAT,
    total_amt_chng_q4_q1 FLOAT,
    total_trans_amt INT,
    total_trans_ct INT,
    total_ct_chng_q4_q1 FLOAT,
    avg_utilization_ratio FLOAT,
    credit_utilization FLOAT,
    high_util_flag INT,
    risk_flag INT
);

select * from 
cleaned_bank_churners