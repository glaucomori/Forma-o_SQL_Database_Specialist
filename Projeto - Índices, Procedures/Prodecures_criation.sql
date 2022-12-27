use ecommerce;
show tables;

-- CRIAÇÃO DE PROCEDURES

-- Procedure para CADASTRO de novos clientes
delimiter \\
create procedure new_clients(
        Fname_p varchar(15),
        Minit_p varchar(5),
        Lname_p varchar(15),
        CPF_p char(11),
        Bdate_p date
)
begin
	insert into  clients (Fname, Minit, Lname, CPF, Bdate) values (Fname_p, Minit_p, Lname_p, CPF_p, Bdate_p);
    select * from clients where CPF = CPF_p;
end \\ 
delimiter ;
call new_clients('Juliano', 'Q', 'Ferreira', '27970940836', '1981-12-26');


-- Procedure para ATUALIZAÇÃO de clientes pelo CPF
delimiter \\
create procedure update_clients(
        Fname_p varchar(15),
        Minit_p varchar(5),
        Lname_p varchar(15),
        CPF_p char(11),
        Bdate_p date
)
begin
	update clients set Fname = Fname_p where CPF = CPF_p;
	update clients set Minit = Minit_p where CPF = CPF_p;
	update clients set Lname = Lname_p where CPF = CPF_p;
	update clients set Bdate = Bdate_p where CPF = CPF_p;
    select * from clients where CPF = CPF_p;
end \\ 
delimiter ;
call update_clients('George', 'Z', 'Martins', '27970940836', '1987-05-26');


-- Procedure para EXCLUSÃO de clientes pelo CPF
delimiter \\
create procedure delete_clients(
        Fname_p varchar(15),
        Minit_p varchar(5),
        Lname_p varchar(15),
        CPF_p char(11),
        Bdate_p date
)
begin
	delete from clients where CPF = CPF_p;
end \\ 
delimiter ;
call delete_clients('Juliano', 'Q', 'Ferreira', '27970940836', '1987-05-26');


-- Procedure para INSERÇÃO, REMOÇÃO e ATUALIZAÇÃO de clientes
delimiter \\
create procedure general_procedure(
		control enum('1', '2', '3'), # 1 --> inserção | 2 --> exclusão | 3 --> atualização
        Fname_p varchar(15),
        Minit_p varchar(5),
        Lname_p varchar(15),
        CPF_p char(11),
        Bdate_p date
)
begin
	case
		when control = 1 then 
			insert into  clients (Fname, Minit, Lname, CPF, Bdate) values (Fname_p, Minit_p, Lname_p, CPF_p, Bdate_p);
			select * from clients where CPF = CPF_p;
		when control = 2 then
			delete from clients where CPF = CPF_p;
		when control = 3 then
			update clients set Fname = Fname_p where CPF = CPF_p;
			update clients set Minit = Minit_p where CPF = CPF_p;
			update clients set Lname = Lname_p where CPF = CPF_p;
			update clients set Bdate = Bdate_p where CPF = CPF_p;
			select * from clients where CPF = CPF_p;
		end case;
end \\ 
delimiter ;

call general_procedure(1, 'Abigail', 'C', 'Martins', '27987940836', '2000-01-26');
