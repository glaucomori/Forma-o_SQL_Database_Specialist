use teste;
show tables;
select * from clients;

-- Para adicionar um índice pode-se usar a função alter table
alter table clients add index index_cpf (CPF);
show index from clients; # exibir os índices
drop index index_cpf on clients; # remover um índice

-- Para adicionar um índice pode-se usar a função create index
create index idx_btree_bdate on clients(Bdate) using hash; -- como o engine padrão (inodb) não tem suporte para hash ele cria o índice como tipo Btree (binary tree)
create index idx_btree_idclient on clients(idClient) using btree;
drop index idx_btree_idclient on clients;

-- outros tipos de índices
-- a tabela precisa ser criada com outro engine que não o inodb que é o padrão. Pode-se usar o motor MEMORY

create table teste_hash (
	id int primary key auto_increment,
    nome varchar(60) not null,
    ativo boolean default true,
    email varchar(50)
) engine = MEMORY;

create index idx_hash_ativo on teste_hash(ativo) using hash;
create index idx_hash_id on teste_hash(id) using btree; -- o engine MEMORY tem suporte para HASH e BTREE e aceita os dois tipos durante a criação de um índice

show index from teste_hash;