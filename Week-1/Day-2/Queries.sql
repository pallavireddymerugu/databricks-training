--Q1
--Display all employee details.
select*from Employees;
--Q2
--Display only employee names and salaries.
select emp_name,salary from Employees;
--Q3
--Display employee names and departments
select emp_name,department from Employees;
--Q4
--Display all employees from the IT department
select*from Employees where department='IT';
--Q5
--Display employee names and experience.
select emp_name,experience from Employees;
--Q6
--Find employees with salary greater than 70000
select*from Employees where salary>70000;
--Q7
--Find employees working in Hyderabad
select*from Employees where city='Hyderabad';
--Q8
--Find employees with experience less than 4 years
select*from Employees where experience<4;
--Q9
--Find employees from Finance department
select*from Employees where department='Finance';
--Q10
--Find employees whose salary is equal to 52000
select*from Employees where salary=52000;
--Q11
--Find total salary department-wise
select department, sum(salary) as total_salary
from Employees
group by department;
--Q12
--Find average salary in each department
select department, avg(salary) as average_salary
from Employees
group by department;
--Q13
--Count employees in each city
select city, count(*) as employee_count
from Employees
group by city;
--Q14
--Find maximum salary in each department
select department, max(salary) as maximum_salary
from Employees
group by department;
--Q15
--Find minimum experience department-wise
select department, min(experience) as minimum_experience
from Employees
group by department;
--Q16
--Find departments having more than 3 employees
select department, count(*) as employee_count
from Employees
group by department
having count(*) > 3;
--Q17
--Find departments where average salary is greater than 60000
select department, avg(salary) as average_salary
from Employees
group by department
having avg(salary) > 60000;
--Q18
--Find cities having more than 2 employees
select city, count(*) as employee_count
from Employees
group by city
having count(*) > 2;
--Q19
--Find departments where total salary is greater than 200000
select department, sum(salary) as total_salary
from Employees
group by department
having sum(salary) > 200000;
--Q20
--Find departments where maximum salary is above 90000
select department, max(salary) as maximum_salary
from Employees
group by department
having max(salary) > 90000;
--Q21
--Display top 5 highest paid employees
select *
from Employees
order by salary desc
limit 5;
--Q22
--Display top 3 employees with highest experience
select *
from Employees
order by experience desc
limit 3;
--Q23
--Display top 2 salaries from Finance department
select *
from Employees
where department = 'Finance'
order by salary desc
limit 2;
--Q24
--Display top 4 employees from Hyderabad
select *
from Employees
where city = 'Hyderabad'
limit 4;
--Q25
--Display top 1 highest salary employee
select *
from Employees
order by salary desc
limit 1;
--Q26
--Display distinct department names
select distinct department
from Employees;
--Q27
--Display distinct city names
select distinct city
from Employees;
--Q28
--Display distinct salary values
select distinct salary
from Employees;
--Q29
--Display distinct combinations of department and city
select distinct department, city
from Employees;
--Q30
--Display distinct experience values
select distinct experience
from Employees;
--Q31
--Find employees with salary >= 80000
select *
from Employees
where salary >= 80000;
--Q32
--Find employees with experience <= 3
select *
from Employees
where experience <= 3;
--Q33
--Find employees whose salary <> 45000
select *
from Employees
where salary <> 45000;
--Q34
--Find employees with salary < 50000
select *
from Employees
where salary < 50000;
--Q35
--Find employees with experience > 5
select *
from Employees
where experience > 5;
--Q36
--Find employees from IT department AND salary greater than 70000
select *
from Employees
where department = 'IT' and salary > 70000;
--Q37
--Find employees from Hyderabad OR Bangalore
select *
from Employees
where city = 'Hyderabad' or city = 'Bangalore';
--Q38
--Find employees from HR department AND experience less than 3
select *
from Employees
where department = 'HR' and experience < 3;
--Q39
--Find employees with salary greater than 60000 OR experience greater than 6
select *
from Employees
where salary > 60000 or experience > 6;
--Q40
--Find employees NOT from Sales department
select *
from Employees
where department <> 'Sales';
--Q41
--Find employees working in ('Hyderabad', 'Mumbai')
select *
from Employees
where city in ('Hyderabad', 'Mumbai');
--Q42
--Find employees whose department IN ('IT', 'Finance')
select *
from Employees
where department in ('IT', 'Finance');
--Q43
--Find employees whose city NOT IN ('Chennai', 'Pune')
select *
from Employees
where city not in ('Chennai', 'Pune');
--Q44
--Find employees whose salary IN (45000, 75000, 91000)
select *
from Employees
where salary in (45000, 75000, 91000);
--Q45
--Find employees whose department NOT IN ('HR', 'Sales')
select *
from Employees
where department not in ('HR', 'Sales');
--Q46
--Find employees with salary BETWEEN 50000 AND 80000
select *
from Employees
where salary between 50000 and 80000;
--Q47
--Find employees with experience BETWEEN 3 AND 6
select *
from Employees
where experience between 3 and 6;
--Q48
--Find employees whose emp_id BETWEEN 105 AND 112
select *
from Employees
where emp_id between 105 and 112;
--Q49
--Find employees with salary NOT BETWEEN 40000 AND 60000
select *
from Employees
where salary not between 40000 and 60000;
--Q50
--Find employees with experience BETWEEN 2 AND 4
select *
from Employees
where experience between 2 and 4;
--Q51
--Find employees whose names start with 'R'
select *
from Employees
where name like 'R%';
--Q52
--Find employees whose names end with 'a'
select *
from Employees
where name like '%a';
--Q53
--Find employees whose names contain 'v'
select *
from Employees
where name like '%v%';
--Q54
--Find employees whose city starts with 'B'
select *
from Employees
where city like 'B%';
--Q55
--Find employees whose department ends with 's'
select *
from Employees
where department like '%s';
