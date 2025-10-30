select sum(salary) as total_expense from employees ;
select dept_id, avg(salary) as average_salary from employees group by dept_id;
select max(salary) from employees;
select count(*) from employees;
select min(salary) from employees where dept_id=3 and emp_id>0;
select d.dept_name, count(*) as num_of_emps from employees e join departments d where e.dept_id=d.dept_id group by d.dept_name;
