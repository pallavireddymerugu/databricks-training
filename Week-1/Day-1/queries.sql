-- Question 1
--Displyaing All columns
SELECT*FROM Employee;
--Q2
--Selecting only name and salary
SELECT name,salary FROM Employee;
--Q3
--older than 50
SELECT*FROM Employee where age>30
--Q4
--Names od departments
SELECT name FROM Department;
--Q5
--employees in IT
SELECT*FROM Employee where department_id=1;
--
