-- inserção de dados
use oficina;

-- clients >> idClient Fname, Surname, Address, CPF, Contact
insert into clients (Fname, Surname, Address, CPF, Contact) values
    ('Sérgio', 'Batista', 'Avenida do Equador, 552, Uberlândia - MG', '62856329050', '11997052189'),
    ('Pedro Henrique', 'Oliveira', 'Rua Adonírio, 971, Uberlândia - MG', '75449826223', '11993971974'),
    ('Arthur', 'Mendes', 'Rua Gurupá, 894, Santarém - PA', '86905995836', '11998838067'),
    ('Letícia', 'Rocha', 'Rua Simões, 615, Manaus - AM', '59301170113', '11997765730'),
    ('Noah', 'Ferreira', 'Rua do Tamborim, 635, Porto Velho - RO', '50521236588', '11995448668'),
    ('Mirella', 'Rocha', 'Rua dos Ventos, 608, Teresina - PI', '94223280674', '11998926452'),
    ('Isadora', 'Assis', 'Rua Araúna, 417, Belo Horizonte - MG', '38550959390', '11992818806'),
    ('Nelson', 'Moraes', 'Rua Trafalgar, 260, Guarapari - ES', '20538462405', '11999636067'),
    ('Letícia', 'Porto', 'Rua Martins de Souza, 814, Olinda - PE', '80611466904', '11997667655'),
    ('Breno', 'Araújo', 'Alameda das Bouganvilles, 625, Brasília - DF', '87123479036', '11999904462');

-- vehicle >> idVehicle, idClient, plate, brand, model, vehicleDescription, manufactureYear, modelYear
insert into vehicle (idClient, plate, brand, model, vehicleDescription, manufactureYear, modelYear) values
    (1, 'GMI7429', 'GM - Chevrolet', 'MONTANA Sport 1.4 ECONOFLEX 8V 2p', 'MONTANA Marrom', 2010, 2010),
    (2, 'KEY8597', 'GM - Chevrolet', 'SPIN LS 1.8 8V Econo.Flex 5p Mec.', 'SPIN Marrom', 2013, 2013),
    (3, 'HZU2517', 'Fiat', 'Fiorino Pick-Up 1.0', 'Fiorino Prata', 1993, 1993),
    (4, 'MTM0416', 'GM - Chevrolet', 'COBALT LTZ 1.8 8V Econo.Flex 4p Mec.', 'COBALT Vermelho', 2013, 2013),
    (5, 'AKU9113', 'VW - VolksWagen', 'Gol 1.0 Plus 16v 2p', 'Gol Prata', 2000, 2000),
    (6, 'LVY2930', 'Fiat', 'Grand Siena ESSENCE ITALIA 1.6 Flex 16V', 'Grand Siena Verde', 2015, 2015),
    (7, 'JGJ5422', 'GM - Chevrolet', 'Meriva Prem.EASYTRONIC 1.8 FlexPower 5p', 'Meriva Preto', 2008, 2008),
    (8, 'HZD9173', 'VW - VolksWagen', 'Parati GL 1.6 Mi/ 1.6/ GLS/ Club 1.6', 'Parati Azul', 1986, 1986),
    (9, 'NDG6596', 'VW - VolksWagen', 'Passat 2.8 V6 Mec.', 'Passat Amarelo', 1998, 1998),
    (10, 'MUM0376', 'Fiat', 'Uno CS/Top/Sport 1.5 i.e. / 1.5 4p', 'Uno Cinza', 1993, 1993);

-- parts >> idParts, partsDescription, unitValue, manufacturer, manufacturerCode
insert into parts (partsDescription, unitValue, manufacturer, manufacturerCode) values
    ('parabrisa', 125.99, 'Vidraçaria Vidrao', '5674131'),
    ('farol xenon', 630.76, 'SpotLight', '3926885'),
    ('pneu', 285.27, 'Michelin', '8453925'),
    ('filtro de combustível', 84.30, 'GM', '4653094'),
    ('filtro de ar', 65.50, 'LiquidAir', '4768577'),
    ('óleo de motor 500mL', 12.54, 'Petronas', '6800233'),
    ('bico injetor', 326.86, 'GM', '6822186'),
    ('parafuso', 5.25, 'Gerdal', '4365940'),
    ('porca', 1.89, 'Gerdal', '1038284'),
    ('arruela', 1.54, 'Gerdal', '2930409');

-- team >> idTeam, idDescription
insert into team (idDescription) values
	('Linha 1'),
    ('Linha 2'),
    ('Linha 3'),
    ('Linha 4');

-- worker >> idWorker, idTeam, Fname, Surname, CPF, specialty, Address
-- opção para specialty ('Trem de força', 'Direção', 'Frenagem', 'Arrefecimento', 'Motor')
insert into worker (idTeam, Fname, Surname, CPF, specialty, Address) values
	(1, 'Pedro', 'Aragão', '60303876859', 'Trem de força', 'Rua Córrego do Limoeiro, 775, São Paulo - SP'),
    (1, 'Isis', 'Dias', '86947435820', 'Direção', 'Rua João Pupo Júnior, 715, São Paulo - SP'),
    (1, 'João', 'Duarte', '18533504861', 'Motor', 'Rua Benedito Luiz Veltroni, 428, São Paulo - SP'),
    (2, 'Cecília', 'Porto', '65145538855', 'Frenagem', 'Rua Seraphim de Carvalho, 681, São Paulo - SP'),
    (2, 'Marlon', 'Freitas', '08096331833', 'Arrefecimento', 'Praça Pedro Bertasso, 192, São Paulo - SP'),
    (2, 'Davi', 'Barros', '43587348804', 'Motor', 'Rua Bruno Alberto Franceschini, 268, São Paulo - SP'),
    (3, 'Ryan', 'Ferreira', '44015312805', 'Arrefecimento', 'Rua Sebastião Dias Freitas, 1287, São Paulo - SP'),
    (3, 'Ailton', 'Costa', '61907299831', 'Frenagem', 'Praça Glauber Rocha, 826, São Paulo - SP'),
    (3, 'Raul', 'Almada', '36123845896', 'Direção', 'Travessa Arthur Otsuzi, 532, São Paulo - SP'),
    (4, 'Rafael', 'Barbosa', '01785972871', 'Trem de força', 'Rua Aristarco Nogueira, 793, São Paulo - SP'),
    (4, 'Calebe', 'Silveira', '71668598817', 'Motor', 'Rua Jaguaribe, 890, São Paulo - SP'),
    (4, 'Olivia', 'Gomes', '15927080804', 'Direção', 'Rua Marieta Mamprim dos Santos, 556, São Paulo - SP');

-- service >> idService, idTeam, serviceType
-- opção para serviceType ('Manutenção corretiva', 'Revisão periódica')
insert into service (idTeam, serviceType) values
	(1, 'Revisão periódica'),
    (2, 'Revisão periódica'),
    (3, 'Revisão periódica'),
    (4, 'Revisão periódica'),
    (1, 'Manutenção corretiva'),
    (2, 'Manutenção corretiva'),
    (3, 'Manutenção corretiva'),
    (4, 'Manutenção corretiva');

-- service_has_parts >> idParts, idService, quantity, subtotal
insert into service_has_parts (idParts, idService, quantity, subtotal) values
	(4, 1, 2, 168.60),
    (5, 1, 1, 65.50),
    (6, 1, 1, 12.54),
    (4, 2, 2, 168.60),
    (5, 2, 1, 65.50),
    (6, 2, 1, 12.54),
    (4, 3, 2, 168.60),
    (5, 3, 1, 65.50),
    (6, 3, 1, 12.54),
    (7, 4, 2, 653.72),
    (6, 4, 1, 12.54),
    (4, 5, 2, 168.60),
    (5, 5, 1, 65.50),
    (6, 5, 1, 12.54),
    (4, 6, 2, 168.60),
    (5, 6, 1, 65.50),
    (6, 6, 1, 12.54),
    (4, 7, 2, 168.60),
    (5, 7, 1, 65.50),
    (6, 7, 1, 12.54),
    (1, 8, 1, 125.99),
    (3, 8, 4, 1141.08);

-- manpower >> idManpower, manpowerDescription, unitValue, manpowerDeadline
insert into manpower (manpowerDescription, unitValue, manpowerDeadline) values
	('Trocar parabrisa', 100.00, 1),
    ('Instalar farol xenon', 50.55, 1),
    ('Trocar pneu', 75.75, 1),
    ('Trocar filtro de combustível', 15.85, 1),
    ('Trocar filtro de ar', 10.55, 1),
    ('Renovar óleo do motor', 22.73, 1),
    ('Trocar bico injetor', 148.38, 2),
    ('Inspecionar veículo', 100.45, 2),
    ('Realizar testes finais', 102.45, 1);

-- service_order >> idSO, idClient, idVehicle, issueDate, authorization, serviceDeadline, serviceStatus
-- opção para authorization ('Pendente - Não liberar serviço', 'Autorizado', 'Não Autorizado') | default 'Pendente - Não liberar serviço'
-- opção para serviceStatus ('Aberto', 'Aguardando autorização', 'Autorizado', 'Em execução', 'Concluído', 'Liberado', 'Cancelado')
insert into service_order (idClient, idVehicle, issueDate, authorization, serviceDeadline, serviceStatus) values
	(1, 1, '2022-09-15', 'Autorizado', '2022-09-22', 'Concluído'),
    (2, 2, '2022-09-17', 'Autorizado', '2022-09-24', 'Concluído'),
    (3, 3, '2022-09-17', 'Autorizado', '2022-09-24', 'Concluído'),
    (4, 4, '2022-09-19', 'Autorizado', '2022-09-26', 'Concluído'),
    (5, 5, '2022-09-19', 'Autorizado', '2022-09-26', 'Concluído'),
    (6, 6, '2022-09-22', 'Autorizado', '2022-09-29', 'Concluído'),
    (7, 7, '2022-09-25', 'Autorizado', '2022-10-01', 'Concluído'),
    (8, 8, '2022-09-26', 'Autorizado', '2022-10-02', 'Concluído'),
    (9, 9, '2022-09-29', 'Autorizado', '2022-10-05', 'Concluído'),
    (10, 10, '2022-09-30', 'Autorizado', '2022-10-06', 'Concluído'),
    (1, 1, '2022-10-11', 'Não Autorizado', '2022-10-18', 'Cancelado'),
    (4, 4, '2022-10-13', 'Autorizado', '2022-10-20', 'Concluído'),
    (5, 5, '2022-10-14', 'Não Autorizado', '2022-10-21', 'Cancelado'),
    (7, 7, '2022-10-18', default, '2022-10-25', 'Aguardando autorização'),
    (9, 9, '2022-10-19', default, '2022-10-26', 'Aguardando autorização');

-- SO_has_service >> idSO, idService
insert into SO_has_service (idSO, idService) values
	(1, 4),
    (2, 3),
    (3, 2),
    (4, 1),
    (5, 1),
    (6, 2),
    (7, 3),
    (8, 4),
    (9, 2),
    (10, 3),
    (11, 5),
    (12, 6),
    (13, 7),
    (14, 8),
    (15, 5);

-- SO_has_manpower >> idManpower, idSO, manpowerQuantity
insert into SO_has_manpower (idManpower, idSO, manpowerQuantity) values
	(4, 1, 1),
    (5, 1, 1),
    (6, 1, 1),
    (4, 2, 1),
    (5, 2, 1),
    (6, 2, 1),
    (4, 3, 1),
    (5, 3, 1),
    (6, 3, 1),
    (4, 4, 1),
    (5, 4, 1),
    (6, 4, 1),
    (4, 5, 1),
    (5, 5, 1),
    (6, 5, 1),
    (4, 6, 1),
    (5, 6, 1),
    (6, 6, 1),
    (4, 7, 1),
    (5, 7, 1),
    (6, 7, 1),
    (4, 8, 1),
    (5, 8, 1),
    (6, 8, 1),
    (4, 9, 1),
    (5, 9, 1),
    (6, 9, 1),
    (4, 10, 1),
    (5, 10, 1),
    (6, 10, 1),
    (8, 11, 1),
    (8, 12, 1),
    (1, 12, 1),
    (8, 13, 1),
    (8, 14, 1),
    (7, 14, 3),
    (8, 15, 1),
    (3, 15, 1);
