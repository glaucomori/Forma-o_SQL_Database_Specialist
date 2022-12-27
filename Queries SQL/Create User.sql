show databases;
use mysql;
show tables;
select * from user;

create user 'geral'@localhost identified by '123456789';
grant all privileges on *.* to 'geral'@localhost;

drop user 'geral'@localhost;