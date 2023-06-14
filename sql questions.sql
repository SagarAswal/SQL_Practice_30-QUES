create database project1;

use project1;

CREATE TABLE department (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE campany (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    revenue int
);

create table employee(
	id int primary key auto_increment,
    name varchar(50) not null,
    city varchar(50) not null,
    department_id int not null,
    salary int not null,
	foreign key (department_id) references department(id)
);

insert into department(name)
values
('IT'),
('Management'),
('IT'),
('Support');

insert into campany(name,revenue)
values
('IBM',2000000),
('GOOGLE',9000000),
('Apple',10000000);

insert into employee(name,city,department_id,salary)
values
('David', 'London', 3, 80000),
('Emily', 'London', 3, 70000),
('Peter', 'Paris', 3, 60000),
('Ava', 'Paris', 3, 50000),
('Penny', 'London', 2, 110000),
('Jim', 'London', 2, 90000),
('Amy', 'Rome', 4, 30000),
('Cloe', 'London', 3, 110000);


select * from department;

UPDATE department SET name = 'Management' WHERE id = 1;

delete from employee WHERE salary > 100000;

SET SQL_SAFE_UPDATES = 0;

select * from campany;

select name,city from employee;

select * from campany
where revenue > 5000000;

select * from campany
where revenue < 5000000;

select * from campany where not revenue >= 5000000;

select * from employee where salary between	50000 AND 70000;

select * from employee where salary >= 50000 and salary <= 70000;

SELECT * FROM employee
WHERE salary = 80000;

select * from employee
where salary <> 80000;

select name from employee
where salary > 70000
or department_id in 
(select id from department where name = 'IT');

select * from employee
where city like 'L%';

select * from employee
where city like 'L%' or city like '%S'

select * from employee
where city like '%O%';

select distinct name from department;

SELECT emp.name, dep.id, dep.name
FROM employee AS emp, department AS dep
WHERE emp.department_id = dep.id
ORDER BY emp.name, dep.id;

SELECT com.name,dep.name
FROM campany com, department dep
ORDER BY com.name;

alter table campany rename company;

show tables

select com.name,dep.name
from company com, department dep
where dep.name not like 'SUPPORT'
order by com.name;


select emp.name,dep.name
from employee emp, department dep
where emp.department_id <> dep.id;


select comp1.name, comp1.name
from company comp1, company comp2
where comp1.name <> comp2.name
order by comp1.name, comp1.name;

SELECT emp1.name FROM employee emp1 EXCEPT
SELECT emp2.name FROM employee emp2 WHERE emp2.salary >= 80000;

select name as company
from company;

select * from employee
where department_id in (select department_id from employee
where name like 'peter')
and name not like 'peter';