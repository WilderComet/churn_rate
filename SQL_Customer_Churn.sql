/*
===========================================================
TELCO CUSTOMER CHURN ANALYSIS

Description:
This SQL analysis explores customer churn behavior using
the Telco Customer Churn dataset. The queries focus on:

- Overall churn metrics
- Churn rate percentage
- Churn by contract type
- Churn by payment method
- Monthly charge trends
- Internet service churn analysis
- Senior citizen churn behavior

The goal of this analysis is to identify patterns and
business insights that can help improve customer retention.
===========================================================
*/


/*
===========================================================
1. TOTAL CUSTOMERS AND CHURNED CUSTOMERS
Purpose:
Calculates the total number of customers and the number
of customers who have churned.
===========================================================
*/

SELECT 
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM telco_customer_churn;



/*
===========================================================
2. OVERALL CHURN RATE PERCENTAGE
Purpose:
Calculates the percentage of customers who churned.
===========================================================
*/

SELECT 
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM telco_customer_churn;



/*
===========================================================
3. CHURN RATE BY CONTRACT TYPE
Purpose:
Analyzes churn behavior across different contract types
to determine which contracts have the highest churn rate.
===========================================================
*/

SELECT 
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM telco_customer_churn
GROUP BY Contract
ORDER BY churn_rate DESC;



/*
===========================================================
4. CHURN BY PAYMENT METHOD
Purpose:
Examines which payment methods are associated with
higher churn counts.
===========================================================
*/

SELECT 
    `Payment Method`,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM telco_customer_churn
GROUP BY `Payment Method`
ORDER BY churned_customers DESC;



/*
===========================================================
5. AVERAGE MONTHLY CHARGES BY CHURN STATUS
Purpose:
Compares average monthly charges between customers
who churned and those who stayed.
===========================================================
*/

SELECT 
    Churn,
    ROUND(AVG(`Monthly Charges`), 2) AS avg_monthly_charges
FROM telco_customer_churn
GROUP BY Churn;



/*
===========================================================
6. CHURN BY INTERNET SERVICE TYPE
Purpose:
Analyzes churn counts across different internet
service categories.
===========================================================
*/

SELECT 
    `Internet Service`,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM telco_customer_churn
GROUP BY `Internet Service`
ORDER BY churned_customers DESC;



/*
===========================================================
7. SENIOR CITIZEN CHURN ANALYSIS
Purpose:
Compares churn behavior between senior citizens
and non-senior citizens.
===========================================================
*/

SELECT 
    `Senior Citizen`,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM telco_customer_churn
GROUP BY `Senior Citizen`;



/*
===========================================================
END OF ANALYSIS
===========================================================
*/