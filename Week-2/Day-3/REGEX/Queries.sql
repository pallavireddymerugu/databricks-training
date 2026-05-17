-- Q1 Extract digits from beginning of mixed_value
SELECT mixed_value, REGEXP_SUBSTR(mixed_value,'^[0-9]+') AS output
FROM regex_practice;

-- Q2 Extract digits from end of mixed_value
SELECT mixed_value, REGEXP_SUBSTR(mixed_value,'[0-9]+$') AS output
FROM regex_practice;

-- Q3 Extract first single character
SELECT mixed_value, REGEXP_SUBSTR(mixed_value,'^.') AS output
FROM regex_practice;

-- Q4 Extract last single character
SELECT mixed_value, REGEXP_SUBSTR(mixed_value,'.$') AS output
FROM regex_practice;

-- Q5 Extract exactly two consecutive digits
SELECT mixed_value, REGEXP_SUBSTR(mixed_value,'[0-9]{2}') AS output
FROM regex_practice;

-- Q6 Extract exactly one digit
SELECT mixed_value, REGEXP_SUBSTR(mixed_value,'[0-9]') AS output
FROM regex_practice;

-- Q7 Extract country code from phone
SELECT phone, REGEXP_SUBSTR(phone,'[0-9]+') AS output
FROM regex_practice;

-- Q8 Extract numeric portion between alphabets
SELECT mixed_value, REGEXP_SUBSTR(mixed_value,'[0-9]+') AS output
FROM regex_practice;

-- Q9 Extract text before @ in email
SELECT email, REGEXP_SUBSTR(email,'^[a-zA-Z0-9._-]+') AS output
FROM regex_practice;

-- Q10 Extract text after @ including domain
SELECT email, REGEXP_SUBSTR(email,'@[a-zA-Z0-9.]+') AS output
FROM regex_practice;

-- Q11 Extract domain without @
SELECT email,
REPLACE(REGEXP_SUBSTR(email,'@[a-zA-Z0-9.]+'),'@','') AS output
FROM regex_practice;

-- Q12 Extract extension after last dot
SELECT email, REGEXP_SUBSTR(email,'[a-zA-Z]+$') AS output
FROM regex_practice;

-- Q13 Extract continuous alphabets
SELECT mixed_value, REGEXP_SUBSTR(mixed_value,'[a-zA-Z]+') AS output
FROM regex_practice;

-- Q14 Extract continuous digits
SELECT mixed_value, REGEXP_SUBSTR(mixed_value,'[0-9]+') AS output
FROM regex_practice;

-- Q15 Extract first 3 characters from full_text
SELECT full_text, REGEXP_SUBSTR(full_text,'^.{3}') AS output
FROM regex_practice;

-- Q16 Extract last 2 characters from full_text
SELECT full_text, REGEXP_SUBSTR(full_text,'.{2}$') AS output
FROM regex_practice;

-- Q17 Extract employee number before first underscore
SELECT full_text, REGEXP_SUBSTR(full_text,'[0-9]+') AS output
FROM regex_practice;

-- Q18 Extract ending country code from full_text
SELECT full_text, REGEXP_SUBSTR(full_text,'[0-9]+$') AS output
FROM regex_practice;

-- Q19 Extract alphabets between underscores
SELECT full_text, REGEXP_SUBSTR(full_text,'_[A-Z]+_') AS output
FROM regex_practice;

-- Q20 Extract country code after plus sign
SELECT phone, REGEXP_SUBSTR(phone,'\\+[0-9]+') AS output
FROM regex_practice;
