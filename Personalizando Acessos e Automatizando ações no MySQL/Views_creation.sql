-- VIEWS --

show databases;
use company;
show tables;
select * from dept_locations;


-- Criar visão para a lista de empregados por departamento e localidade
create view employees_by_department_vw as
	select 	concat(e.Fname, " ",e.Minit, " ",e.Lname) as Employee, 
			d.Dname as Department, 
			dl.Dlocation as Location
    from employee e
    join department d on e.Dno = d.Dnumber
    join dept_locations dl on d.Dnumber = dl.Dnumber
    order by d.Dnumber;
    
select * from employees_by_department_vw;


-- Criar visão para o número de empregados por departamento e localidade
create view employee_vw as
	select 	d.Dname as Department, dl.Dlocation as Location, count(e.Ssn) as Employees
    from department d
    join dept_locations dl on d.Dnumber = dl.Dnumber
    join employee e on d.Dnumber = e.Dno
    group by Department
    order by Department;
    
select * from employee_vw;

-- Criar visão para a lista de departamentos e seus gerentes 
create view dept_managers_vw as
	select d.Dname as Department, concat(e.Fname, " ",e.Minit, " ",e.Lname) as Manager
    from department d
    join employee e on d.Mgr_ssn = e.Ssn
    order by d.Dnumber;

select * from dept_managers_vw;


-- Crear visão para os projetos com maior número de empregados (ex: por ordenação desc)
create view projects_by_employees_vw as
	select p.Pname as Project, count(e.Ssn) as Employees
    from project p
    join works_on w on p.Pnumber = w.Pno
    join employee e on w.Essn = e.Ssn
    group by Project
    order by Employees DESC;
    
select * from projects_by_employees_vw;


-- Criar visão para a lista de projetos, departamentos e gerentes
create view project_list_vw as
	select p.Pname as Project, d.Dname as Department, concat(e.Fname, " ",e.Minit, " ",e.Lname) as Manager
    from project p
    join department d on p.Dnum = d.Dnumber
    join employee e on d.Mgr_ssn = e.Ssn;
    
select * from project_list_vw;


-- Criar visão para identificar quais dos empregados possuem dependentes e se são gerentes
create view employees_with_dependents_vw as
	select concat(e.Fname,' ', e.Minit,' ',e.Lname) as Employee,
		e.Ssn,
		count(d.Dependent_name) as Dependents,
		e.Manager
	from employee e 
	join dependent d on e.Ssn = d.Essn
	group by Employee;

select * from employees_with_dependents_vw;