show databases;
use teste;
show tables;
select * from product;
desc product;

-- drop procedure insert_procudt;

delimiter \\
create procedure insert_procudt(
	in idProduct_p int, 
    in productCategory_p enum('Eletrônicos','Informática','Casa','Utilidades'),
    in productDescription_p varchar(255),
    in price_p float
)
begin
	insert into product (idProduct, productCategory, productDescription, price) values (idProduct_p, productCategory_p, productDescription_p, price_p);
    select * from product where idProduct = idProduct_p;
end \\ 
delimiter ;

call insert_procudt(98, 'Utilidades', 'Luva de Silicone', 20);
