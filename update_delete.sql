update employees e join departments d on e.dept_id = d.dept_id set e.salary = e.salary * 1.10 where dept_name = 'HR';
update employees set dept_id = 3 where emp_name = 'Bob' and emp_id > 0;
delete from employees where  join_date < '2020-01-01' and emp_id > 0;
delete from employees where emp_id = 104 and emp_id > 0;
update employees set salary = salary + 5000 where dept_id = 4 and emp_id > 0;