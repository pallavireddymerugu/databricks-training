-- 1. Employees and their managers including employees without managers
SELECT e.emp_name AS employee_name,
       m.emp_name AS manager_name
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;

-- 2. Employees and their departments including employees without departments
SELECT e.emp_name,
       d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;

-- 3. Employees who report to managers with manager names
SELECT e.emp_name AS employee_name,
       m.emp_name AS manager_name
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.emp_id;

-- 4. Total salary paid to employees with department including empty departments
SELECT d.department_name,
       e.emp_name,
       SUM(s.salary) AS total_salary
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
LEFT JOIN salaries s
ON e.emp_id = s.emp_id
GROUP BY d.department_name, e.emp_name;

-- 5. Employees without any department
SELECT e.emp_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

-- 6. Employees and assigned projects including employees without projects
SELECT e.emp_name,
       p.project_name
FROM employees e
LEFT JOIN employee_projects ep
ON e.emp_id = ep.emp_id
LEFT JOIN projects p
ON ep.project_id = p.project_id;

-- 7. Employees who completed at least one project
SELECT e.emp_name,
       p.project_name
FROM employees e
INNER JOIN employee_projects ep
ON e.emp_id = ep.emp_id
INNER JOIN projects p
ON ep.project_id = p.project_id;

-- 8. Employees and projects ensuring no project omitted
SELECT e.emp_name,
       p.project_name
FROM employees e
RIGHT JOIN employee_projects ep
ON e.emp_id = ep.emp_id
RIGHT JOIN projects p
ON ep.project_id = p.project_id;

-- 9. Employees with salaries including missing salary records
SELECT e.emp_name,
       s.salary
FROM employees e
LEFT JOIN salaries s
ON e.emp_id = s.emp_id;

-- 10. Employees and department names including employees without department
SELECT e.emp_name,
       d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;

-- 11. Departments and employees including departments without employees
SELECT d.department_name,
       e.emp_name
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id;

-- 12. Employees with contact information including missing contacts
SELECT e.emp_name,
       c.phone_number,
       c.email
FROM employees e
LEFT JOIN contacts c
ON e.emp_id = c.emp_id;

-- 13. Employees and departments including unmatched records on both sides
SELECT e.emp_name,
       d.department_name
FROM employees e
FULL OUTER JOIN departments d
ON e.department_id = d.department_id;

-- 14. Employees without projects
SELECT e.emp_name,
       p.project_name
FROM employees e
LEFT JOIN employee_projects ep
ON e.emp_id = ep.emp_id
LEFT JOIN projects p
ON ep.project_id = p.project_id
WHERE p.project_id IS NULL;

-- 15. Employees and project names including employees without projects
SELECT e.emp_name,
       p.project_name
FROM employees e
LEFT JOIN employee_projects ep
ON e.emp_id = ep.emp_id
LEFT JOIN projects p
ON ep.project_id = p.project_id;

-- 16. Projects and employees including projects without employees
SELECT p.project_name,
       e.emp_name
FROM projects p
LEFT JOIN employee_projects ep
ON p.project_id = ep.project_id
LEFT JOIN employees e
ON ep.emp_id = e.emp_id;

-- 17. Employees having manager and at least one project
SELECT e.emp_name AS employee_name,
       m.emp_name AS manager_name,
       p.project_name
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.emp_id
INNER JOIN employee_projects ep
ON e.emp_id = ep.emp_id
INNER JOIN projects p
ON ep.project_id = p.project_id;

-- 18. Employees with departments excluding employees without departments
SELECT e.emp_name,
       d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;

-- 19. Employees belonging to multiple departments
SELECT e.emp_name,
       d.department_name
FROM employee_departments ed
INNER JOIN employees e
ON ed.emp_id = e.emp_id
INNER JOIN departments d
ON ed.department_id = d.department_id;

-- 20. Departments and employees including departments without employees
SELECT d.department_name,
       e.emp_name
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id;

-- 21. Employees with projects but without department
SELECT e.emp_name,
       p.project_name
FROM employees e
INNER JOIN employee_projects ep
ON e.emp_id = ep.emp_id
INNER JOIN projects p
ON ep.project_id = p.project_id
LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

-- 22. Total employees in each department including empty departments
SELECT d.department_name,
       COUNT(e.emp_id) AS total_employees
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

-- 23. Employees who report to managers only
SELECT e.emp_name AS employee_name,
       m.emp_name AS manager_name
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.emp_id;

-- 24. All employees and managers including employees without managers
SELECT e.emp_name AS employee_name,
       m.emp_name AS manager_name
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;

-- 25. Departments and employee count including empty departments
SELECT d.department_name,
       COUNT(e.emp_id) AS employee_count
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

-- 26. Employees and departments including empty departments
SELECT e.emp_name,
       d.department_name
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id;

-- 27. Employees without salary records
SELECT e.emp_name
FROM employees e
LEFT JOIN salaries s
ON e.emp_id = s.emp_id
WHERE s.salary IS NULL;

-- 28. Employees and project assignments including employees without projects
SELECT e.emp_name,
       p.project_name
FROM employees e
LEFT JOIN employee_projects ep
ON e.emp_id = ep.emp_id
LEFT JOIN projects p
ON ep.project_id = p.project_id;

-- 29. Employees with departments and projects including missing assignments
SELECT e.emp_name,
       d.department_name,
       p.project_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN employee_projects ep
ON e.emp_id = ep.emp_id
LEFT JOIN projects p
ON ep.project_id = p.project_id;

-- 30. Employees with department names including employees without departments
SELECT e.emp_name,
       d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;
