show databases;
use teste;
show tables;
select * from address;
desc address;

################################################# TRIGGER STRUCTURE #################################################
/*
CREATE
	[DEFINER = user]
    TRIGGER [IF NOT EXISTS] trigger_name
    trigger_time trigger_event
    ON table_name FOR EACH ROW
    [trigger_order]
    trigger_body
    
trigger_time: { BEFORE | AFTER }
trigger_event: { INSERT | UPDATE | DELETE }
trigger_order: { FOLLOWS | PROCEDES } other_trigger_name
*/
#####################################################################################################################


-- before insert statement
# determinando que para estados da região sudeste a definição de país será diferente
delimiter \\
create trigger country_modifier before insert on address for each row
	begin
		case
			when new.state = 'MG' then set new.country = 'Brasil - Sudeste';
			when new.state = 'ES' then set new.country = 'Brasil - Sudeste';
			when new.state = 'SP' then set new.country = 'Brasil - Sudeste';
			when new.state = 'RJ' then set new.country = 'Brasil - Sudeste';
            else set new.country = 'Brasil';
		end case;
    end \\ delimiter ;
show triggers;
drop trigger country_modifier;
-- teste para ver se o trigger está funcionando
insert into address (idAddress, idClient, street, number_km, complement, neighborhood, city, state) values
	(11, 11, 'Rua 99', 99, null, 'Centro', 'Bolívia', 'ES');




-- after insert statement
# verificar se existe algum valor nulo que não foi passado
# adiciona uma mensagem para o usuário.
# primeiro criamos uma tabela para receber a mensagem, pois o trigger não pode retornar valores como mensagens.
create table error_messages (
	id int auto_increment primary key,
    message varchar(100),
    messageDate datetime 
);
delimiter \\
create trigger null_address_complement_check after insert on address for each row
	if (new.complement is null) then
		insert into error_messages (message, messageDate) values (concat('Não foi informado complemento para o ID de endereço ', new.idAddress), now());
	end if;
\\ delimiter ;
select * from error_messages;
show triggers;
drop trigger null_address_complement_check;
drop table error_messages;
delete from address where idAddress = 11;




-- before update statement
delimiter \\
create trigger number_street before update on address for each row
	begin
		case
			when new.number_km > 1000 then set new.number_km = 1000;
            else set new.number_km = new.number_km;
		end case;
    end \\ delimiter ;
    
update address set number_km = 1001 where idAddress = 14;
select * from address;
show triggers;
drop trigger number_street;
desc address;

