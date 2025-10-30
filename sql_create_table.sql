use sample;
create table dept(dno varchar(10) primary key , dname varchar(30) not null, mgreno int not null);
insert into dept(dno, dname, mgreno)values('D1','Consulting',1001),('D2','Development',1002),('D3','Research',1003);
drop table students;
create table emp(eno int primary key , ename varchar(30), bdate varchar(20) ,title varchar(30),salary int ,dno varchar(10), foreign key(dno) references dept(dno));
insert into emp(eno, ename,  bdate, title, salary, dno)values( 1001, 'Alice', 1980-03-10, 'Manager', 85000 ,'D1');
insert into emp(eno, ename,  bdate, title, salary, dno)values( 1002, 'Bob', 1985-07-14, 'EE', 40000 ,'D2');
insert into emp(eno, ename,  bdate, title, salary, dno)values( 1003, 'Charlie',1990-01-20, 'SA', 37000 ,'D1');
insert into emp(eno, ename,  bdate, title, salary, dno)values( 1004, 'David', 1988-09-12, 'EE', 32000 ,'D3');
insert into emp(eno, ename,  bdate, title, salary, dno)values( 1005, 'Eve', 1992-11-05, 'Manager', 90000 ,'D2');
create table proj(pno int primary key , pname varchar(30), budget int ,dno varchar(10), foreign key(dno) references dept(dno));
insert into proj(pno, pname, budget, dno)values( 501, 'Alpha', 120000, 'D1');
insert into proj(pno, pname, budget, dno)values( 502, 'Beta', 45000, 'D2');
insert into proj(pno, pname, budget, dno)values( 503, 'Gamma', 75000, 'D3');
insert into proj(pno, pname, budget, dno)values( 504, 'Delta', 200000, 'D1');
create table workson(eno int,foreign key(eno) references emp(eno) ,pno int,foreign key(pno) references proj(pno),resp varchar(30),hours int);
insert into workson(eno, pno, resp, hours)values(1001, 501, 'Manager', 15);
insert into workson(eno, pno, resp, hours)values(1002, 502, 'Developer', 8);
insert into workson(eno, pno, resp, hours)values(1003, 501, 'Consultant', 12);
insert into workson(eno, pno, resp, hours)values(1004, 503, 'Tester', 9);
insert into workson(eno, pno, resp, hours)values(1005, 504, 'Manager', 18);


