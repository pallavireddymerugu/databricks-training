-- QUESTION 1 : Employee Compensation Classification
SELECT emp_id,
UPPER(emp_name) AS upper_name,
LOWER(emp_name) AS lower_name,
CONCAT(UCASE(LEFT(emp_name,1)),LCASE(SUBSTRING(emp_name,2))) AS proper_name,
ROUND(base_salary + IFNULL(bonus,0)) AS total_income,
YEAR(joining_date) AS joining_year,
CASE
WHEN TIMESTAMPDIFF(YEAR,joining_date,CURDATE()) > 7 THEN 'Senior'
WHEN TIMESTAMPDIFF(YEAR,joining_date,CURDATE()) BETWEEN 4 AND 7 THEN 'Mid'
ELSE 'Junior'
END AS experience_level
FROM employee_payments;

-- QUESTION 2 : Order Delivery Delay Analysis
SELECT order_id,
UPPER(customer_name) AS customer,
DATEDIFF(IFNULL(delivery_date,CURDATE()),order_date) AS delivery_days,
TRUNCATE(order_amount,1) AS amount,
CASE
WHEN delivery_date IS NULL THEN 'Pending'
WHEN DATEDIFF(delivery_date,order_date)=0 THEN 'Same-day'
WHEN DATEDIFF(delivery_date,order_date)>3 THEN 'Delayed'
ELSE 'Normal'
END AS status
FROM orders_delivery;

-- QUESTION 3 : Customer Spending Pattern
SELECT cust_id,
CONCAT(UCASE(LEFT(cust_name,1)),LCASE(SUBSTRING(cust_name,2))) AS customer,
MONTHNAME(purchase_date) AS month_name,
ROUND(purchase_amount) AS rounded_amount,
ABS(purchase_amount) AS abs_amount,
CASE
WHEN purchase_amount > 15000 THEN 'High spender'
WHEN purchase_amount BETWEEN 8000 AND 15000 THEN 'Medium'
ELSE 'Low'
END AS spending_type
FROM customer_spending;

-- QUESTION 4 : Subscription Validity Check
SELECT user_id,
SUBSTRING_INDEX(email,'@',-1) AS domain,
TIMESTAMPDIFF(MONTH,start_date,end_date) AS duration_months,
FORMAT(subscription_fee,2) AS formatted_fee,
DATEDIFF(end_date,CURDATE()) AS remaining_days,
CASE
WHEN end_date < CURDATE() THEN 'Expired'
WHEN DATEDIFF(end_date,CURDATE()) <=30 THEN 'Expiring Soon'
ELSE 'Active'
END AS status
FROM subscriptions;

-- QUESTION 5 : Loan EMI Risk Categorization
SELECT loan_id,
UPPER(customer_name) AS customer,
ROUND(POWER((1+interest_rate/100),1),2) AS monthly_interest,
TIMESTAMPDIFF(YEAR,loan_start,CURDATE()) AS years,
ROUND(loan_amount/12) AS emi,
CASE
WHEN interest_rate > 9 THEN 'High Risk'
WHEN interest_rate BETWEEN 8 AND 9 THEN 'Medium Risk'
ELSE 'Low Risk'
END AS risk_level
FROM loan_details;

-- QUESTION 6 : Employee Attendance Evaluation
SELECT emp_id,
LOWER(emp_name) AS employee,
ROUND((present_days/total_days)*100) AS attendance_percent,
MONTHNAME(record_date) AS month_name,
(total_days-present_days) AS absent_days,
CASE
WHEN (present_days/total_days)*100 >=90 THEN 'Excellent'
WHEN (present_days/total_days)*100 BETWEEN 75 AND 89 THEN 'Average'
ELSE 'Poor'
END AS attendance_status
FROM attendance;

-- QUESTION 7 : Product Discount Validation
SELECT product_id,
ABS(mrp-selling_price) AS discount_amount,
ROUND(((mrp-selling_price)/mrp)*100,2) AS discount_percent,
DAYNAME(sale_date) AS day_name,
CONCAT(UCASE(LEFT(product_name,1)),LCASE(SUBSTRING(product_name,2))) AS product,
CASE
WHEN selling_price < mrp THEN 'Valid Discount'
WHEN selling_price > mrp THEN 'Overpriced'
ELSE 'No Discount'
END AS status
FROM product_sales;

-- QUESTION 8 : Insurance Policy Aging
SELECT policy_id,
TIMESTAMPDIFF(YEAR,policy_start,policy_end) AS duration_years,
DATEDIFF(policy_end,CURDATE()) AS remaining_days,
ROUND(premium_amount) AS premium,
UPPER(holder_name) AS holder,
CASE
WHEN policy_end < CURDATE() THEN 'Expired'
WHEN TIMESTAMPDIFF(YEAR,policy_start,policy_end)>=3 THEN 'Long Term'
ELSE 'Mid Term'
END AS policy_type
FROM insurance_policies;

-- QUESTION 9 : Salary Increment Simulation
SELECT emp_id,
TIMESTAMPDIFF(YEAR,last_hike,CURDATE()) AS years_since_hike,
CASE
WHEN rating=5 THEN current_salary*0.20
WHEN rating=4 THEN current_salary*0.10
ELSE 0
END AS increment_amount,
ROUND(current_salary+
CASE
WHEN rating=5 THEN current_salary*0.20
WHEN rating=4 THEN current_salary*0.10
ELSE 0
END) AS new_salary,
LOWER(emp_name) AS employee,
CASE
WHEN rating=5 THEN 'High Increment'
WHEN rating=4 THEN 'Moderate'
ELSE 'No Increment'
END AS increment_status
FROM salary_revision;

-- QUESTION 10 : Customer Account Status Evaluation
SELECT account_id,
ABS(balance) AS abs_balance,
DATEDIFF(CURDATE(),last_transaction) AS inactive_days,
CONCAT(UCASE(LEFT(branch,1)),LCASE(SUBSTRING(branch,2))) AS branch_name,
SIGN(balance) AS balance_sign,
CASE
WHEN balance < 0 THEN 'Overdrawn'
WHEN DATEDIFF(CURDATE(),last_transaction)>365 THEN 'Dormant'
ELSE 'Active'
END AS account_status
FROM bank_accounts;
