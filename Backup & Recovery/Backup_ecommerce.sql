CREATE DATABASE  IF NOT EXISTS `ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecommerce`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `idAddress` int NOT NULL AUTO_INCREMENT,
  `idClient` int NOT NULL,
  `street` varchar(45) NOT NULL,
  `number_km` varchar(10) NOT NULL,
  `complement` varchar(45) DEFAULT NULL,
  `neighborhood` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL,
  PRIMARY KEY (`idAddress`),
  UNIQUE KEY `idAddress` (`idAddress`),
  KEY `idClient` (`idClient`),
  KEY `idx_street_btree` (`street`) USING BTREE,
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `clients` (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,1,'Rua Porto Velho','224',NULL,'Palmeiras','Diamantino','MT','Brasil'),(2,2,'Rua A','749',NULL,'Vista Alegre','Santa Maria','RS','Brasil'),(3,3,'Rua Padre Lopes','1376','ap 301','Centro','Caxias do Sul','RS','Brasil'),(4,4,'Avenida Mariana Peixoto','190',NULL,'Cascatinha','Vitória da Conquista','BA','Brasil'),(5,5,'Avenida Gilberto Salles','3409','loja 2','Centro','Juazeiro do Norte','CE','Brasil'),(6,6,'Rua 14','24',NULL,'Santa Clara','Natal','RN','Brasil'),(7,7,'Rua General Abilio','64','casa 3','São José','Bacabal','MA','Brasil'),(8,8,'Rua 19 de Junho','33','ap 505','Centro','Ubatuba','SP','Brasil'),(9,9,'Avenida Gentil','45','ap 602','Praia','Paraty','RJ','Brasil'),(10,10,'Rua Adalberto Lima','331','casa 5','Centro','Vitória','ES','Brasil');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `idClient` int NOT NULL AUTO_INCREMENT,
  `Fname` varchar(15) NOT NULL,
  `Minit` varchar(5) DEFAULT NULL,
  `Lname` varchar(15) NOT NULL,
  `CPF` char(11) NOT NULL,
  `Bdate` date NOT NULL,
  PRIMARY KEY (`idClient`),
  UNIQUE KEY `idClient` (`idClient`,`CPF`),
  KEY `idx_Fname_btree` (`Fname`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'André','T','Silva','29770940836','1991-05-12'),(2,'Isabela','M','Campos','92583487884','1970-07-18'),(3,'Laura','S','Fogaça','89959128806','1949-09-05'),(4,'Martin','E','Silveira','23810673889','1969-03-12'),(5,'Flávia','M','Teixeira','70407877843','1963-07-15'),(6,'Davi','B','Moreira','14814637802','1996-02-06'),(7,'Marcela','N','Neves','15569230823','1973-07-09'),(8,'Kevin','R','Freitas','25359704810','1966-03-10'),(9,'Thomas','O','Porto','88542565878','1994-04-26'),(10,'Heloísa','G','Costa','66777560840','1990-12-05');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `idDelivery` int NOT NULL AUTO_INCREMENT,
  `deliveryStatus` enum('Pedido em transferência','Pedido em transporte','Pedido entregue','Pedido não entregue') NOT NULL,
  `deliveryCode` varchar(45) NOT NULL,
  `deliveryDeadline` date NOT NULL,
  `deliveryDdate` date DEFAULT NULL,
  `return_deadline` date DEFAULT NULL,
  `shipping` float NOT NULL,
  PRIMARY KEY (`idDelivery`),
  UNIQUE KEY `idDelivery` (`idDelivery`,`deliveryCode`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,'Pedido em transferência','GR237373829RF','2022-11-20',NULL,NULL,15.2),(2,'Pedido entregue','EH179182856UJ','2022-11-03','2020-10-26','2020-11-25',36.5),(3,'Pedido em transferência','RN314161872QD','2022-11-23',NULL,NULL,10.85),(4,'Pedido entregue','IN107346205EC','2022-11-01','2020-10-24','2020-11-23',24.15),(5,'Pedido em transporte','OS988611954BR','2022-11-15',NULL,NULL,17.19),(6,'Pedido entregue','NW930619090UX','2022-11-08','2020-10-20','2020-11-19',18);
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `idInventory` int NOT NULL AUTO_INCREMENT,
  `inventoryDescription` varchar(45) NOT NULL,
  PRIMARY KEY (`idInventory`),
  UNIQUE KEY `idInventory` (`idInventory`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,'Estoque Centro 1'),(2,'Estoque Centro 2'),(3,'Estoque Centro 3');
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_has_product`
--

DROP TABLE IF EXISTS `inventory_has_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_has_product` (
  `idProduct` int NOT NULL,
  `idInventory` int NOT NULL,
  `inventoryQuantity` int NOT NULL,
  PRIMARY KEY (`idProduct`,`idInventory`),
  KEY `idInventory` (`idInventory`),
  CONSTRAINT `inventory_has_product_ibfk_1` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`),
  CONSTRAINT `inventory_has_product_ibfk_2` FOREIGN KEY (`idInventory`) REFERENCES `inventory` (`idInventory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_has_product`
--

LOCK TABLES `inventory_has_product` WRITE;
/*!40000 ALTER TABLE `inventory_has_product` DISABLE KEYS */;
INSERT INTO `inventory_has_product` VALUES (1,1,50),(2,3,150),(3,1,25),(4,2,50),(5,2,100),(6,2,50),(7,2,50),(8,2,100),(9,3,200),(10,3,100),(11,1,250),(12,2,100);
/*!40000 ALTER TABLE `inventory_has_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `idOrder` int NOT NULL AUTO_INCREMENT,
  `idClient` int NOT NULL,
  `idAddress` int NOT NULL,
  `idDelivery` int NOT NULL,
  `idPayment_method` int NOT NULL,
  `orderDdescription` varchar(255) NOT NULL,
  `orderStatus` enum('Pedido realizado','Pagamento aprovado','Pedido em separação','Pedido em transferência','Pedido entregue','Pedido cancelado') NOT NULL DEFAULT 'Pedido realizado',
  `orderDate` date NOT NULL,
  `total` float NOT NULL,
  PRIMARY KEY (`idOrder`),
  UNIQUE KEY `idOrder` (`idOrder`),
  KEY `idClient` (`idClient`),
  KEY `idAddress` (`idAddress`),
  KEY `idDelivery` (`idDelivery`),
  KEY `idPayment_method` (`idPayment_method`),
  KEY `idx_idOrder_btree` (`idOrder`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `clients` (`idClient`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`idAddress`) REFERENCES `address` (`idAddress`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`idDelivery`) REFERENCES `delivery` (`idDelivery`),
  CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`idPayment_method`) REFERENCES `payment_method` (`idPayment_method`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,1,1,'Compra online','Pedido em transferência','2022-10-20',115.2),(2,2,2,2,2,'Compra online','Pedido entregue','2022-10-03',286.5),(3,3,3,3,3,'Compra em loja física','Pedido em transferência','2022-10-23',160.85),(4,4,4,4,4,'Compra online','Pedido entregue','2022-10-01',1524.15),(5,5,5,5,5,'Compra online','Pedido em transferência','2022-11-15',317.19),(6,6,6,6,6,'Compra online','Pedido entregue','2022-11-08',518);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_has_product`
--

DROP TABLE IF EXISTS `orders_has_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_has_product` (
  `idProduct` int NOT NULL,
  `idOrder` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`idProduct`,`idOrder`),
  KEY `idOrder` (`idOrder`),
  CONSTRAINT `orders_has_product_ibfk_1` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`),
  CONSTRAINT `orders_has_product_ibfk_2` FOREIGN KEY (`idOrder`) REFERENCES `orders` (`idOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_has_product`
--

LOCK TABLES `orders_has_product` WRITE;
/*!40000 ALTER TABLE `orders_has_product` DISABLE KEYS */;
INSERT INTO `orders_has_product` VALUES (1,1,2),(2,2,2),(3,3,1),(4,4,1),(5,5,1),(6,6,2);
/*!40000 ALTER TABLE `orders_has_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_method` (
  `idPayment_method` int NOT NULL AUTO_INCREMENT,
  `idClient` int NOT NULL,
  `payment_method` enum('Boleto','Pix','Cartão de crédito','Cartão de débito') NOT NULL,
  `bank_slip` varchar(50) DEFAULT NULL,
  `pix` varchar(200) DEFAULT NULL,
  `card_number` char(16) DEFAULT NULL,
  `cardholder_name` varchar(45) DEFAULT NULL,
  `card_expiration_date` date DEFAULT NULL,
  PRIMARY KEY (`idPayment_method`),
  UNIQUE KEY `idPayment_method` (`idPayment_method`),
  KEY `idClient` (`idClient`),
  CONSTRAINT `payment_method_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `clients` (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method`
--

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
INSERT INTO `payment_method` VALUES (1,1,'Cartão de crédito',NULL,NULL,'1234123412341234','ANDRE T SILVA','2030-12-31'),(2,2,'Cartão de crédito',NULL,NULL,'1384457771050922','ISABELA M CAMPOS','2028-06-30'),(3,3,'Cartão de crédito',NULL,NULL,'5645882021176009','LAURA S FOGACA','2025-07-31'),(4,4,'Boleto','Gerar boleto',NULL,NULL,NULL,NULL),(5,5,'Cartão de crédito',NULL,NULL,'8124123987236826','FLAVIA M TEIXEIRA','2028-04-30'),(6,6,'Cartão de crédito',NULL,NULL,'2719184394917844','DAVI B MOREIRA','2026-08-31'),(7,7,'Cartão de crédito',NULL,NULL,'9996242819620970','MARCELA N NEVES','2028-06-30'),(8,8,'Pix',NULL,'Gerar código Pix',NULL,NULL,NULL),(9,9,'Cartão de débito',NULL,NULL,'7063442724362810','THOMAS O PORTO','2026-02-28'),(10,10,'Cartão de crédito',NULL,NULL,'8472545559021700','HELOISA G COSTA','2029-06-30');
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `idProduct` int NOT NULL AUTO_INCREMENT,
  `productCategory` enum('Eletrônicos','Informática','Casa','Utilidades') NOT NULL,
  `productDescription` varchar(255) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`idProduct`),
  UNIQUE KEY `idProduct` (`idProduct`),
  KEY `idx_productDescription_btree` (`productDescription`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Utilidades','Cafeteira Elétrica 127V Preta',50),(2,'Casa','Travesseiro Pena de Ganso em Viscose',125),(3,'Utilidades','Aparelho de Jantar 16 Peças com Taças',150),(4,'Informática','Notebook Celeron 4GB 120GB SSD 14.1\" Preto',1500),(5,'Eletrônicos','Mini Iluminador Ring Light De Mesa 8 Polegadas',300),(6,'Informática','Mouse Óptico sem fio',250),(7,'Informática','Tablet 32GB Wi-Fi Tela 7\" Android - Cinza',800),(8,'Eletrônicos','Caixa de Som Bluetooth',300),(9,'Casa','Jogo de Cama Casal 5 Peças',400),(10,'Casa','Jogo de Toalhas 4 Peças',150),(11,'Utilidades','Dispenser para Sabão Líquido Deluxe',25),(12,'Informática','Teclado sem fio ABNT2',50);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider` (
  `idProvider` int NOT NULL AUTO_INCREMENT,
  `providerName` varchar(45) NOT NULL,
  `providerCNPJ` char(14) NOT NULL,
  `providerContact` varchar(45) NOT NULL,
  PRIMARY KEY (`idProvider`),
  UNIQUE KEY `idProvider` (`idProvider`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES (1,'1001 Utilidades','32665882561195','11910655532'),(2,'High Tech Ltda.','37110044379342','11983832784'),(3,'EstaLar','70302868310108','11949880020');
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider_has_product`
--

DROP TABLE IF EXISTS `provider_has_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider_has_product` (
  `idProvider` int NOT NULL,
  `idProduct` int NOT NULL,
  `providerQuantity` int NOT NULL,
  `providerLeadtime` int NOT NULL,
  PRIMARY KEY (`idProvider`,`idProduct`),
  KEY `idProduct` (`idProduct`),
  CONSTRAINT `provider_has_product_ibfk_1` FOREIGN KEY (`idProvider`) REFERENCES `provider` (`idProvider`),
  CONSTRAINT `provider_has_product_ibfk_2` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider_has_product`
--

LOCK TABLES `provider_has_product` WRITE;
/*!40000 ALTER TABLE `provider_has_product` DISABLE KEYS */;
INSERT INTO `provider_has_product` VALUES (1,1,1000,30),(1,3,1000,30),(1,11,1000,30),(2,4,1000,20),(2,5,1000,20),(2,6,1000,20),(2,7,1000,20),(2,8,1000,20),(2,12,1000,20),(3,2,1000,15),(3,9,1000,15),(3,10,1000,15);
/*!40000 ALTER TABLE `provider_has_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `idSeller` int NOT NULL AUTO_INCREMENT,
  `sellerName` varchar(45) NOT NULL,
  `sellerCNPJ` char(14) NOT NULL,
  `sellerContact` varchar(45) NOT NULL,
  PRIMARY KEY (`idSeller`),
  UNIQUE KEY `idSeller` (`idSeller`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,'Comércio 3 Irmãos','17782113936955','11999447085'),(2,'Loja do Coelho','40788703753002','11995781875'),(3,'Home Sweet Home','46534592343242','11991087022');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller_has_product`
--

DROP TABLE IF EXISTS `seller_has_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller_has_product` (
  `idSeller` int NOT NULL,
  `idProduct` int NOT NULL,
  `quantity` int NOT NULL,
  `sellerLeadtime` int NOT NULL,
  PRIMARY KEY (`idSeller`,`idProduct`),
  KEY `idProduct` (`idProduct`),
  CONSTRAINT `seller_has_product_ibfk_1` FOREIGN KEY (`idSeller`) REFERENCES `seller` (`idSeller`),
  CONSTRAINT `seller_has_product_ibfk_2` FOREIGN KEY (`idProduct`) REFERENCES `product` (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller_has_product`
--

LOCK TABLES `seller_has_product` WRITE;
/*!40000 ALTER TABLE `seller_has_product` DISABLE KEYS */;
INSERT INTO `seller_has_product` VALUES (1,1,1000,6),(1,3,1000,6),(1,11,1000,6),(2,4,1000,4),(2,5,1000,4),(2,6,1000,4),(2,7,1000,4),(2,8,1000,4),(2,12,1000,4),(3,2,1000,3),(3,9,1000,3),(3,10,1000,3);
/*!40000 ALTER TABLE `seller_has_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ecommerce'
--

--
-- Dumping routines for database 'ecommerce'
--
/*!50003 DROP PROCEDURE IF EXISTS `delete_clients` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_clients`(
        Fname_p varchar(15),
        Minit_p varchar(5),
        Lname_p varchar(15),
        CPF_p char(11),
        Bdate_p date
)
begin
	delete from clients where CPF = CPF_p;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `general_procedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `general_procedure`(
		control enum('1', '2', '3'),
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `new_clients` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `new_clients`(
        Fname_p varchar(15),
        Minit_p varchar(5),
        Lname_p varchar(15),
        CPF_p char(11),
        Bdate_p date
)
begin
	insert into  clients (Fname, Minit, Lname, CPF, Bdate) values (Fname_p, Minit_p, Lname_p, CPF_p, Bdate_p);
    select * from clients where CPF = CPF_p;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_clients` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_clients`(
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
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-18 10:06:12
