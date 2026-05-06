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
--Q6
--employees with starting letter J
Select*from Employee where name like 'J%';
--Q7
--employees with ending letter as e
Select*from Employee where name like '%e';
--Q8
--employees whose names containing a
Select*from Employee where name like '%a%';
--Q9
--whose name having exactly 9 characters
Select*from Employee where length(name)=9;
--Q10
--having o as second letter
select*from Employee where name like '_a%';
--Q11
--employees hired in 2020
select*from Employee where year(hire_date)=2020;
--Q12
--employees hired in january
select*from Employee where month(hire_date)=1;
--Q13
--employees hired before 2019
select*from Employee where year(hire_date)<2019;
--Q14
--employees hired after march 1,2021
select*from Employee where year(hire_date)>=2021 and month(hire_date)>=3 and date(hire_date)>=1;
--Q15
--employees hired in last two years
select*from Employee where year(hire_date) in(2025,2024);
--Q16
--Total salary
select total(salary) from Employee;
--Q17
--Average
select avg(salary) from Employee;
--Q18
--Minimum 
select min(salary) from Employee;
--Q19
--no. of employees in each department
select department_id,count(distinct name) from Employee group by department_id;
--Q20
--avg salary of employees in each department
select department_id,avg(salary) from Employee group by department_id;
--Q21
--Total salary for each department
select department_id,sum(salary) from Employee group by department_id;
--Q22
--average of employees in each department
select year(hire_date),count(*) from Employee group by year(hire_date);
--Q23
--
select department_id,avg(age) from Employee group by department_id;
--Q23
--no. of employees hired in each year
select year(hire_date),count(*) from Employee group by year(hire_date);
--Q24
--highest salary in each department
select department_id,max(salary) from Employee group by department_id;
--Q25
--highest average(salary) department
SELECT department_id FROM Employee GROUP BY department_id
HAVING AVG(salary) = (
    SELECT MAX(avg_salary)
    FROM (
        SELECT AVG(salary) AS avg_salary
        FROM Employee
        GROUP BY department_id
    ) AS dept_avg
);
