-- 1. Employees and their managers including employees without managers
SELECT employees.emp_name AS employee_name,
       managers.emp_name AS manager_name
FROM employees
LEFT JOIN employees AS managers
ON employees.manager_id = managers.emp_id;

-- 2. Employees and their departments including employees without departments
SELECT employees.emp_name,
       departments.dept_name
FROM employees
LEFT JOIN departments
ON employees.dept_id = departments.dept_id;

-- 3. Employees who report to managers with manager names
SELECT employees.emp_name AS employee_name,
       managers.emp_name AS manager_name
FROM employees
INNER JOIN employees AS managers
ON employees.manager_id = managers.emp_id;

-- 4. Employees and their departments including departments without employees
SELECT departments.dept_name,
       employees.emp_name
FROM departments
LEFT JOIN employees
ON departments.dept_id = employees.dept_id;

-- 5. Employees without any department
SELECT employees.emp_name
FROM employees
LEFT JOIN departments
ON employees.dept_id = departments.dept_id
WHERE departments.dept_id IS NULL;

-- 6. Employees and assigned projects including employees without projects
SELECT employees.emp_name,
       projects.project_name
FROM employees
LEFT JOIN projects
ON employees.emp_id = projects.emp_id;

-- 7. Employees who completed at least one project
SELECT employees.emp_name,
       projects.project_name
FROM employees
INNER JOIN projects
ON employees.emp_id = projects.emp_id;

-- 8. Employees and projects ensuring no project omitted
SELECT employees.emp_name,
       projects.project_name
FROM employees
RIGHT JOIN projects
ON employees.emp_id = projects.emp_id;

-- 9. Employees and salaries including missing salary records
SELECT employees.emp_name,
       salaries.salary
FROM employees
LEFT JOIN salaries
ON employees.emp_id = salaries.emp_id;

-- 10. Employees and department names including employees without department
SELECT employees.emp_name,
       departments.dept_name
FROM employees
LEFT JOIN departments
ON employees.dept_id = departments.dept_id;

-- 11. Departments and employees including departments without employees
SELECT departments.dept_name,
       employees.emp_name
FROM departments
LEFT JOIN employees
ON departments.dept_id = employees.dept_id;

-- 12. Employees with contact information including missing contacts
SELECT employees.emp_name,
       contacts.phone_number,
       contacts.email
FROM employees
LEFT JOIN contacts
ON employees.emp_id = contacts.emp_id;

-- 13. Employees and departments including unmatched records
SELECT employees.emp_name,
       departments.dept_name
FROM employees
LEFT JOIN departments
ON employees.dept_id = departments.dept_id

UNION

SELECT employees.emp_name,
       departments.dept_name
FROM departments
LEFT JOIN employees
ON departments.dept_id = employees.dept_id;

-- 14. Employees without projects
SELECT employees.emp_name,
       projects.project_name
FROM employees
LEFT JOIN projects
ON employees.emp_id = projects.emp_id
WHERE projects.project_id IS NULL;

-- 15. Employees and project names including employees without projects
SELECT employees.emp_name,
       projects.project_name
FROM employees
LEFT JOIN projects
ON employees.emp_id = projects.emp_id;

-- 16. Projects and employees including projects without employees
SELECT projects.project_name,
       employees.emp_name
FROM projects
LEFT JOIN employees
ON projects.emp_id = employees.emp_id;

-- 17. Employees having manager and at least one project
SELECT employees.emp_name AS employee_name,
       managers.emp_name AS manager_name,
       projects.project_name
FROM employees
INNER JOIN employees AS managers
ON employees.manager_id = managers.emp_id
INNER JOIN projects
ON employees.emp_id = projects.emp_id;

-- 18. Employees with departments excluding employees without departments
SELECT employees.emp_name,
       departments.dept_name
FROM employees
INNER JOIN departments
ON employees.dept_id = departments.dept_id;

-- 19. Employees and their departments
SELECT employees.emp_name,
       departments.dept_name
FROM employees
INNER JOIN departments
ON employees.dept_id = departments.dept_id;

-- 20. Departments and employees including departments without employees
SELECT departments.dept_name,
       employees.emp_name
FROM departments
LEFT JOIN employees
ON departments.dept_id = employees.dept_id;

-- 21. Employees with projects but without department
SELECT employees.emp_name,
       projects.project_name
FROM employees
INNER JOIN projects
ON employees.emp_id = projects.emp_id
LEFT JOIN departments
ON employees.dept_id = departments.dept_id
WHERE departments.dept_id IS NULL;

-- 22. Total employees in each department including empty departments
SELECT departments.dept_name,
       COUNT(employees.emp_id) AS total_employees
FROM departments
LEFT JOIN employees
ON departments.dept_id = employees.dept_id
GROUP BY departments.dept_name;

-- 23. Employees who report to managers only
SELECT employees.emp_name AS employee_name,
       managers.emp_name AS manager_name
FROM employees
INNER JOIN employees AS managers
ON employees.manager_id = managers.emp_id;

-- 24. All employees and managers including employees without managers
SELECT employees.emp_name AS employee_name,
       managers.emp_name AS manager_name
FROM employees
LEFT JOIN employees AS managers
ON employees.manager_id = managers.emp_id;

-- 25. Departments and employee count including empty departments
SELECT departments.dept_name,
       COUNT(employees.emp_id) AS employee_count
FROM departments
LEFT JOIN employees
ON departments.dept_id = employees.dept_id
GROUP BY departments.dept_name;

-- 26. Employees and departments including empty departments
SELECT employees.emp_name,
       departments.dept_name
FROM departments
LEFT JOIN employees
ON departments.dept_id = employees.dept_id;

-- 27. Employees without salary records
SELECT employees.emp_name
FROM employees
LEFT JOIN salaries
ON employees.emp_id = salaries.emp_id
WHERE salaries.emp_id IS NULL;

-- 28. Employees and project assignments including employees without projects
SELECT employees.emp_name,
       projects.project_name
FROM employees
LEFT JOIN projects
ON employees.emp_id = projects.emp_id;

-- 29. Employees with department and project assignments
SELECT employees.emp_name,
       departments.dept_name,
       projects.project_name
FROM employees
LEFT JOIN departments
ON employees.dept_id = departments.dept_id
LEFT JOIN projects
ON employees.emp_id = projects.emp_id;

-- 30. Employees with department names including employees without departments
SELECT employees.emp_name,
       departments.dept_name
FROM employees
LEFT JOIN departments
ON employees.dept_id = departments.dept_id;
