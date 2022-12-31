use ecommerce;
show tables;

select * from orders;
show index from orders;

-- Criação de índices para as consultas

-- Na tabela 'product' a informação mais importante numa consulta seria a descrição dos produtos que aparece na coluna 'productDescription'
-- uso da estrutura 'btree' para o índice por se tratar de um atributo com grande quantidade de valores.
create index idx_productDescription_btree on product(productDescription) using btree; 
drop index idx_street_btree on product;

-- Na tabela 'address' a informação mais importante numa consulta seria o nome da rua que aparece na coluna 'street'
-- uso da estrutura 'btree' para o índice por se tratar de um atributo com grande quantidade de valores.
create index idx_street_btree on address(street) using btree; 

-- Na tabela 'clients' a informação mais importante numa consulta seria o nome do cliente que aparece na coluna 'Fname'
-- uso da estrutura 'btree' para o índice por se tratar de um atributo com grande quantidade de valores.
create index idx_Fname_btree on clients(Fname) using btree; 

-- Na tabela 'orders' a informação mais importante numa consulta seria a identificação da ordem que aparece na coluna 'idOrder'
-- uso da estrutura 'btree' para o índice por se tratar de um atributo com grande quantidade de valores.
create index idx_idOrder_btree on orders(idOrder) using btree; 

