select emp_name, salary from employees where salary > (select avg(salary) from employees);
select emp_name from employees where salary = (select max(salary) from employees);
select e.emp_name from employees e where e.dept_id in (select d.dept_id from departments d where d.dept_name in('IT','HR'));
select e.emp_name from employees e where e.dept_id in (select d.dept_id from departments d where d.dept_name in ('Finance'));
select dept_name from departments d where (select max(salary) from employees e where e.dept_id = d.dept_id ) > 60000; 

