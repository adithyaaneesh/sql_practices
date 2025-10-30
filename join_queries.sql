select e.emp_name , d.dept_name from employees e join departments d on e.dept_id = d.dept_id;
select e.emp_name , d.dept_name from employees e left join departments d on e.dept_id = d.dept_id;
select d.dept_name , e.emp_name from departments d right join employees e on e.dept_id = d.dept_id;
select e.emp_id, e.emp_name ,e.salary, d.dept_name, e.join_date from employees e left join departments d on e.dept_id = d.dept_id 
union 
select e.emp_id, e.emp_name ,e.salary, d.dept_name, e.join_date from employees e right join departments d on e.dept_id = d.dept_id;
select d.dept_name from departments d left join employees e on d.dept_id = e.dept_id where e.emp_id is null;