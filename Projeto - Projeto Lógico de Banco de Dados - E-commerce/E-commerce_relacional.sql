-- criação do banco de dados para o cenário de E-commerce
-- drop database ecommerce;
create database ecommerce;
use ecommerce;

-- Criar tabelas

-- criar tabela cLiente
create table clients (
		idClient int not null auto_increment,
        Fname varchar(15) not null,
        Minit varchar(5),
        Lname varchar(15) not null,
        CPF char(11) not null,
        Bdate date not null,
        unique (idClient, CPF),
        primary key (idClient)
);
alter table clients auto_increment=0;

-- criar tabela endereço
create table address (
		idAddress int not null auto_increment,
        idClient int not null,
        street varchar(45) not null,
        number_km varchar(10) not null,
        complement varchar(45),
        neighborhood varchar(45) not null,
        city varchar(45) not null,
        state varchar(45) not null,
        country varchar(45) not null,
        primary key (idAddress),
        foreign key (IdClient) references clients(idClient),
        unique (idAddress)
);
alter table address auto_increment=0;

-- criar tabela metodo_pagamento
create table payment_method (
		idPayment_method int not null auto_increment,
        idClient int not null,
        payment_method enum('Boleto', 'Pix', 'Cartão de crédito', 'Cartão de débito') not null,
        bank_slip varchar(50),
        pix varchar(200),
        card_number char(16),
        cardholder_name varchar(45),
        card_expiration_date date,
        primary key (idPayment_method),
        foreign key (IdClient) references clients(idClient),
        unique (idPayment_method)
);
alter table payment_method auto_increment=0;

-- criar tabela entrega
create table delivery (
		idDelivery int not null auto_increment,
        deliveryStatus enum('Pedido em transferência', 'Pedido em transporte', 'Pedido entregue', 'Pedido não entregue') not null,
        deliveryCode varchar(45) not null,
        deliveryDeadline date not null,
        deliveryDdate date,
        return_deadline date,
        shipping float not null,
        primary key (idDelivery),
        unique (idDelivery, deliveryCode)
);
alter table delivery auto_increment=0;

-- criar tabela pedido
create table orders (
		idOrder int not null auto_increment,
        idClient int not null,
        idAddress int not null,
        idDelivery int not null,
        idPayment_method int not null,
        orderDdescription varchar(255) not null,
        orderStatus enum('Pedido realizado', 'Pagamento aprovado', 'Pedido em separação', 'Pedido em transferência', 'Pedido entregue', 'Pedido cancelado') not null default 'Pedido realizado',
        orderDate date not null,
        total float not null,
        primary key (idOrder),
        foreign key (IdClient) references clients(idClient),
        foreign key (idAddress) references address(idAddress),
        foreign key (idDelivery) references delivery(idDelivery),
        foreign key (idPayment_method) references payment_method(idPayment_method),
        unique (idOrder)
);
alter table orders auto_increment=0;

-- criar tabela produto
create table product (
		idProduct int not null auto_increment,
        productCategory enum('Eletrônicos', 'Informática', 'Casa', 'Utilidades') not null,
        productDescription varchar(255) not null,
        price float not null,
        primary key (idProduct),
        unique (idProduct)
);
alter table product auto_increment=0;

-- criar tabela relação_pedido_produto
create table orders_has_product (
		idProduct int not null,
        idOrder int not null,
        quantity int not null,
        primary key (idProduct, idOrder),
        foreign key (idProduct) references product(idProduct),
        foreign key (idOrder) references orders(idOrder)
);

-- criar tabela estoque
create table inventory (
		idInventory int not null auto_increment,
        inventoryDescription varchar(45) not null,
        primary key (idInventory),
        unique (idInventory)
);
alter table inventory auto_increment=0;

-- criar tabela produto_em_estoque
create table inventory_has_product (
		idProduct int not null,
        idInventory int not null,
        inventoryQuantity int not null,
        primary key (idProduct, idInventory),
        foreign key (idProduct) references product(idProduct),
        foreign key (idInventory) references inventory(idInventory)
);

-- criar tabela fornecedor
create table provider (
		idProvider int not null auto_increment,
        providerName varchar(45) not null,
        providerCNPJ char(14) not null,
        providerContact varchar(45) not null,
        primary key (idProvider),
        unique (idProvider)
);
alter table provider auto_increment=0;

-- criar tabela produto_no_fornecedor
create table provider_has_product (
		idProvider int not null,
        idProduct int not null,
        providerQuantity int not null,
        providerLeadtime int not null,
        primary key (idProvider, idProduct),
        foreign key (idProvider) references provider(idProvider),
        foreign key (idProduct) references product(idProduct)
);

-- criar tabela vendedor_terceiro
create table seller (
		idSeller int not null auto_increment,
        sellerName varchar(45) not null,
        sellerCNPJ char(14) not null,
        sellerContact varchar(45) not null,
        primary key (idSeller),
        unique (idSeller)
);
alter table seller auto_increment=0;

-- criar tabela produto_em_vendedor_terceiro
create table seller_has_product (
		idSeller int not null,
        idProduct int not null,
        quantity int not null,
        sellerLeadtime int not null,
        primary key (idSeller, idProduct),
        foreign key (idSeller) references seller(idSeller),
        foreign key (idProduct) references product(idProduct)
);
