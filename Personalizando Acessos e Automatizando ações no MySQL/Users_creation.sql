-- USERS __

show databases;
use company;
show tables;
select * from user;

-- Criação de usuários
create user 'manager'@localhost identified by 'managerpassword'; # usuário gerente
create user 'employee'@localhost identified by 'memployeepassword'; # usuário empregados

-- Concessão de acesso ao usuário
grant all privileges on company.* to 'manager'@localhost; # acesso irrestrito para gerente
grant all privileges on company.projects_by_employees_vw to 'manager'@localhost; # acesso para os empregados
