 --Eg. 1
 WITH max_salaries as 
 (SELECT max(salary) maximum_salary, trunc(avg(salary)) average_salary, department_id 
 FROM employees 
 GROUP BY department_id) 
 SELECT employee_id, maximum_salary, average_salary, department_id 
 FROM employees e
 NATURAL JOIN max_salaries
 
 --Eg. 2 (Recursive Query): 
 WITH all_managers(employee, manager, department) as 
 (SELECT employee_id, manager_id, department_id FROM employees
 UNION ALL 
 SELECT all_managers.employee, employee.manager_id, all_managers.department FROM all_managers, employees
 WHERE all_managers.manager = employees.employee_id) 
 SELECT employee, manager, department FROM all_managers 
 ORDER BY employee; 
 
 --Eg. 3 Inserts with subqueries
 INSERT INTO (SELECT d.department_id, d.department_name, d.manager_id, d.location_id
 FROM department_temp d 
 JOIN locations l 
 ON (d.location = l.location_id) 
 WHERE l.city = 'Oxford') 
 VALUES (300, 'Marketing', 200, 2500) 
 
