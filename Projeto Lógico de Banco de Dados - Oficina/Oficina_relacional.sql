-- criação do banco de dados para o cenário de E-commerce
-- drop database oficina;
create database oficina;
use oficina;

-- Criar tabelas

-- Criar tabela cliente
create table clients (
		idClient int not null auto_increment,
        Fname varchar(15) not null,
        Surname varchar(15) not null,
        Address varchar(255) not null,
        CPF char(11) not null,
        Contact varchar(45) not null,
        unique (idClient, CPF),
        primary key (idClient)
);
alter table clients auto_increment=0;

-- Criar tabela Veículo
create table vehicle (
		idVehicle int not null auto_increment,
        idClient int not null,
        plate char(7) not null,
        brand varchar(15) not null,
        model varchar(45) not null,
        vehicleDescription varchar(45) not null,
        manufactureYear year not null,
        modelYear year not null,
        primary key (idVehicle),
        foreign key (idClient) references clients(idClient),
        unique (idVehicle, idClient, plate)
);
alter table vehicle auto_increment=0;

-- Criar tabela Peça
create table parts (
		idParts int not null auto_increment,
        partsDescription varchar(45) not null,
        unitValue numeric(7, 2) not null,
        manufacturer varchar(45) not null,
        manufacturerCode varchar(45) not null,
        primary key (idParts),
        unique (idParts, manufacturerCode)
);
alter table parts auto_increment=0;

-- Criar tabela Equipe
create table team (
		idTeam int not null auto_increment,
        idDescription varchar(45) not null,
        primary key (idTeam),
        unique (idTeam)
);
alter table team auto_increment=0;

-- Criar tabela Mecânicos
create table worker (
		idWorker int not null auto_increment,
        idTeam int not null,
        Fname varchar(15) not null,
        Surname varchar(15) not null,
        CPF char(11) not null,
        specialty enum('Trem de força', 'Direção', 'Frenagem', 'Arrefecimento', 'Motor'), 
        Address varchar(255) not null,
        primary key (idWorker),
        foreign key (idTeam) references team(idTeam),
        unique (idWorker, idTeam, CPF)
);
alter table worker auto_increment=0;

-- Criar tabela Serviço
create table service (
		idService int not null auto_increment,
        idTeam int not null,
        serviceType enum('Manutenção corretiva', 'Revisão periódica') not null,
        primary key (idService),
        foreign key (idTeam) references team(idTeam),
        unique (idService, idTeam)
);
alter table service auto_increment=0;

-- Criar tabela Peças do Serviço
create table service_has_parts (
		idParts int not null,
        idService int not null,
        quantity int not null,
        subtotal float not null,
        primary key (idParts, idService),
        foreign key (idService) references service(idService),
        foreign key (idParts) references parts(idParts)
);

-- Criar tabela Valor da Mão de Obra
create table manpower (
		idManpower int not null auto_increment,
        manpowerDescription varchar(45) not null,
        unitValue numeric(7, 2) not null,
        manpowerDeadline int not null,
        primary key (idManpower),
        unique (idManpower)
);
alter table manpower auto_increment=0;

-- Criar tabela Ordem de Serviço
create table service_order (
		idSO int not null auto_increment,
        idClient int not null,
        idVehicle int not null,
        issueDate date not null,
        authorization ENUM('Pendente - Não liberar serviço', 'Autorizado', 'Não Autorizado') not null default 'Pendente - Não liberar serviço',
        serviceDeadline date not null,
        serviceStatus enum('Aberto', 'Aguardando autorização', 'Autorizado', 'Em execução', 'Concluído', 'Liberado', 'Cancelado') not null,
        primary key (idSO),
        foreign key (idClient) references clients(idClient),
        foreign key (idVehicle) references vehicle(idVehicle),
        unique (idSO)
);
alter table service_order auto_increment=0;

-- Criar tabela Serviços da OS
create table SO_has_service (
		idSO int not null,
        idService int not null,
        primary key (idSO, idService),
        foreign key (idSO) references service_order(idSO),
        foreign key (idService) references service(idService)
);

-- Criar tabela Valor da OS
create table SO_has_manpower (
		idManpower int not null,
        idSO int not null,
        manpowerQuantity int not null,
        primary key (idManpower, idSO),
        foreign key (idManpower) references manpower(idManpower),
        foreign key (idSO) references service_order(idSO)
);
