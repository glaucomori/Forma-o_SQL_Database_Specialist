-- TRIGGERS --

show databases;
use company;
show triggers;
select * from employee;
describe employee;
alter table employee modify Manager enum('Yes','No');

-- criação de triggers de remoção

-- criação de trigger para remoção de empregados
-- adicionar o empregado demitido em uma tabela específica
create table fired_employees (
	Fname varchar(20) not null,
    Minit char(1),
    Lname varchar(20) not null,
    Ssn char(11) not null primary key,
    Bdate date,
    Address varchar(30),
    Gender enum('F','M'),
    Salary decimal(10,2),
    Super_ssn char(11),
    Dno int,
    Manager enum('Yes','No')
);

delimiter \\
create trigger fired_employee_tg before delete on employee for each row
	begin
		insert into fired_employees (Fname, Minit, Lname, Ssn, Bdate, Address, Gender, Salary, Super_ssn, Dno, Manager) values
					(old.Fname, old.Minit, old.Lname, old.Ssn, old.Bdate, old.Address, old.Gender, old.Salary, old.Super_ssn, old.Dno, old.Manager);
    end \\ delimiter ;



-- criação de triggers de atualização

-- criação de trigger para atualização de funcionário
-- Não permitir que um funcionário tenha seu salário reduzido

delimiter \\
create trigger update_salary_restriction_tg before update on employee for each row
	begin
		case 
			when new.Salary < old.Salary then set new.Salary = old.Salary;
            else set new.Salary = new.Salary;
		end case;
	end \\ delimiter ;
