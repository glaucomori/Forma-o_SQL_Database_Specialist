-- inserção de dados
use ecommerce;

-- clients >> idClient, Fname, Minit, Lname, CPF, Bdate
insert into  clients (Fname, Minit, Lname, CPF, Bdate)
		 values ('André', 'T', 'Silva', '29770940836', '1991-05-12'),
				('Isabela', 'M', 'Campos', '92583487884', '1970-07-18'),
				('Laura', 'S', 'Fogaça', '89959128806', '1949-09-05'),
				('Martin', 'E', 'Silveira', '23810673889', '1969-03-12'),
                ('Flávia', 'M', 'Teixeira', '70407877843', '1963-07-15'),
                ('Davi', 'B', 'Moreira', '14814637802', '1996-02-06'),
                ('Marcela', 'N', 'Neves', '15569230823', '1973-07-09'),
                ('Kevin', 'R', 'Freitas', '25359704810', '1966-03-10'),
                ('Thomas', 'O', 'Porto', '88542565878', '1994-04-26'),
				('Heloísa', 'G', 'Costa', '66777560840', '1990-12-05');

-- address >> idAddress, idClient, street, number_km, complement, neighborhood, city, state, country
insert into  address (idClient, street, number_km, complement, neighborhood, city, state, country)
		 values ('1', 'Rua Porto Velho', '224', null, 'Palmeiras', 'Diamantino', 'MT', 'Brasil'),
				('2', 'Rua A', '749', null, 'Vista Alegre', 'Santa Maria', 'RS', 'Brasil'),
                ('3', 'Rua Padre Lopes', '1376', 'ap 301', 'Centro', 'Caxias do Sul', 'RS', 'Brasil'),
                ('4', 'Avenida Mariana Peixoto', '190', null, 'Cascatinha', 'Vitória da Conquista', 'BA', 'Brasil'),
                ('5', 'Avenida Gilberto Salles', '3409', 'loja 2', 'Centro', 'Juazeiro do Norte', 'CE', 'Brasil'),
                ('6', 'Rua 14', '24', null, 'Santa Clara', 'Natal', 'RN', 'Brasil'),
                ('7', 'Rua General Abilio', '64', 'casa 3', 'São José', 'Bacabal', 'MA', 'Brasil'),
                ('8', 'Rua 19 de Junho', '33', 'ap 505', 'Centro', 'Ubatuba', 'SP', 'Brasil'),
                ('9', 'Avenida Gentil', '45', 'ap 602', 'Praia', 'Paraty', 'RJ', 'Brasil'),
                ('10', 'Rua Adalberto Lima', '331', 'casa 5', 'Centro', 'Vitória', 'ES', 'Brasil');

-- payment_method >> idPayment_method, idClient, payment_method, bank_slip, pix, card_number, cardholder_name, card_expiration_date
-- opção para payment_method ('Boleto', 'Pix', 'Cartão de crédito', 'Cartão de débito')
insert into  payment_method (idClient, payment_method, bank_slip, pix, card_number, cardholder_name, card_expiration_date)
		 values ('1', 'Cartão de crédito', null, null, '1234123412341234', 'ANDRE T SILVA', '2030-12-31'),
				('2', 'Cartão de crédito', null, null, '1384457771050922', 'ISABELA M CAMPOS', '2028-06-30'),
                ('3', 'Cartão de crédito', null, null, '5645882021176009', 'LAURA S FOGACA', '2025-07-31'),
                ('4', 'Boleto', 'Gerar boleto', null, null, null, null),
                ('5', 'Cartão de crédito', null, null, '8124123987236826', 'FLAVIA M TEIXEIRA', '2028-04-30'),
                ('6', 'Cartão de crédito', null, null, '2719184394917844', 'DAVI B MOREIRA', '2026-08-31'),
                ('7', 'Cartão de crédito', null, null, '9996242819620970', 'MARCELA N NEVES', '2028-06-30'),
                ('8', 'Pix', null, 'Gerar código Pix', null, null, null),
                ('9', 'Cartão de débito', null, null, '7063442724362810', 'THOMAS O PORTO', '2026-02-28'),
                ('10', 'Cartão de crédito', null, null, '8472545559021700', 'HELOISA G COSTA', '2029-06-30');

-- delivery >> idDelivery, deliveryStatus, deliveryCode, deliveryDeadline, deliveryDdate, return_deadline, shipping
-- opção para deliveryStatus ('Pedido em transferência', 'Pedido em transporte', 'Pedido entregue', 'Pedido não entregue')
insert into  delivery (deliveryStatus, deliveryCode, deliveryDeadline, deliveryDdate, return_deadline, shipping)
		 values ('Pedido em transferência', 'GR237373829RF', '2022-11-20', null, null, 15.20),
				('Pedido entregue', 'EH179182856UJ', '2022-11-03', '2020-10-26', '2020-11-25', 36.50),
                ('Pedido em transferência', 'RN314161872QD', '2022-11-23', null, null, 10.85),
                ('Pedido entregue', 'IN107346205EC', '2022-11-01', '2020-10-24', '2020-11-23', 24.15),
                ('Pedido em transporte', 'OS988611954BR', '2022-11-15', null, null, 17.19),
                ('Pedido entregue', 'NW930619090UX', '2022-11-08', '2020-10-20', '2020-11-19', 18.00);

-- orders >> idOrder, idClient, idAddress, idDelivery, idPayment_method, orderDdescription, orderStatus, orderDate, total
-- opção para orderStatus('Pedido realizado', 'Pagamento aprovado', 'Pedido em separação', 'Pedido em transferência', 'Pedido entregue', 'Pedido cancelado')
insert into  orders (idClient, idAddress, idDelivery, idPayment_method, orderDdescription, orderStatus, orderDate, total)
		 values ('1', '1', '1', '1', 'Compra online', 'Pedido em transferência', '2022-10-20', 115.20),
				('2', '2', '2', '2', 'Compra online', 'Pedido entregue', '2022-10-03', 286.50),
                ('3', '3', '3', '3', 'Compra em loja física', 'Pedido em transferência', '2022-10-23', 160.85),
                ('4', '4', '4', '4', 'Compra online', 'Pedido entregue', '2022-10-01', 1524.15),
                ('5', '5', '5', '5', 'Compra online', 'Pedido em transferência', '2022-11-15', 317.19),
                ('6', '6', '6', '6', 'Compra online', 'Pedido entregue', '2022-11-08', 518.00);

-- product >> idProduct, productCategory, productDescription, price
-- opção para productCategory ('Eletrônicos', 'Informática', 'Casa', 'Utilidades')
insert into  product (productCategory, productDescription, price)
		 values ('Utilidades', 'Cafeteira Elétrica 127V Preta', 50.00),
				('Casa', 'Travesseiro Pena de Ganso em Viscose', 125.00),
                ('Utilidades', 'Aparelho de Jantar 16 Peças com Taças', 150.00),
                ('Informática', 'Notebook Celeron 4GB 120GB SSD 14.1" Preto', 1500.00),
                ('Eletrônicos', 'Mini Iluminador Ring Light De Mesa 8 Polegadas', 300.00),
				('Informática', 'Mouse Óptico sem fio', 250.00),
                ('Informática', 'Tablet 32GB Wi-Fi Tela 7" Android - Cinza', 800.00),
                ('Eletrônicos', 'Caixa de Som Bluetooth', 300.00),
                ('Casa', 'Jogo de Cama Casal 5 Peças', 400.00),
				('Casa', 'Jogo de Toalhas 4 Peças', 150.00),
                ('Utilidades', 'Dispenser para Sabão Líquido Deluxe', 25.00),
                ('Informática', 'Teclado sem fio ABNT2', 50.00);

-- orders_has_product >> idProduct, idOrder, quantity
insert into  orders_has_product (idProduct, idOrder, quantity)
		 values (1, 1, 2),
				(2, 2, 2),
                (3, 3, 1),
                (4, 4, 1),
                (5, 5, 1),
                (6, 6, 2);

-- inventory >> idInventory, inventoryDescription
insert into  inventory (inventoryDescription)
		 values ('Estoque Centro 1'),
				('Estoque Centro 2'),
                ('Estoque Centro 3');

-- inventory_has_product >> idProduct, idInventory, inventoryQuantity
insert into  inventory_has_product (idProduct, idInventory, inventoryQuantity)
		 values (1, 1, 50),
				(2, 3, 150),
                (3, 1, 25),
                (4, 2, 50),
                (5, 2, 100),
                (6, 2, 50),
                (7, 2, 50),
                (8, 2, 100),
                (9, 3, 200),
                (10, 3, 100),
                (11, 1, 250),
                (12, 2, 100);

-- provider >> idProvider, providerName, providerCNPJ, providerContact
insert into  provider (providerName, providerCNPJ, providerContact)
		 values ('1001 Utilidades', '32665882561195', '11910655532'),
				('High Tech Ltda.', '37110044379342', '11983832784'),
                ('EstaLar', '70302868310108', '11949880020');

-- provider_has_product >> idProvider, idProduct, providerQuantity, providerLeadtime
insert into  provider_has_product (idProvider, idProduct, providerQuantity, providerLeadtime)
		 values (1, 1, 1000, 30),
				(1, 3, 1000, 30),
                (1, 11, 1000, 30),
                (2, 4, 1000, 20),
                (2, 5, 1000, 20),
                (2, 6, 1000, 20),
                (2, 7, 1000, 20),
                (2, 8, 1000, 20),
                (2, 12, 1000, 20),
                (3, 2, 1000, 15),
                (3, 9, 1000, 15),
                (3, 10, 1000, 15);

-- seller >> idSeller, sellerName, sellerCNPJ, sellerContact
insert into  seller (sellerName, sellerCNPJ, sellerContact)
		 values ('Comércio 3 Irmãos', '17782113936955', '11999447085'),
				('Loja do Coelho', '40788703753002', '11995781875'),
                ('Home Sweet Home', '46534592343242', '11991087022');

-- seller_has_product >> idSeller, idProduct, quantity, sellerLeadtime
insert into  seller_has_product (idSeller, idProduct, quantity, sellerLeadtime)
		 values (1, 1, 1000, 6),
				(1, 3, 1000, 6),
                (1, 11, 1000, 6),
                (2, 4, 1000, 4),
                (2, 5, 1000, 4),
                (2, 6, 1000, 4),
                (2, 7, 1000, 4),
                (2, 8, 1000, 4),
                (2, 12, 1000, 4),
                (3, 2, 1000, 3),
                (3, 9, 1000, 3),
                (3, 10, 1000, 3);
