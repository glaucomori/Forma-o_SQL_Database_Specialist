-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: company
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `Dname` varchar(20) NOT NULL,
  `Dnumber` int NOT NULL,
  `Mgr_ssn` char(11) DEFAULT NULL,
  `Mgr_start_date` date DEFAULT NULL,
  PRIMARY KEY (`Dnumber`),
  UNIQUE KEY `Mgr_ssn` (`Mgr_ssn`,`Dnumber`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`Mgr_ssn`) REFERENCES `employee` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('RH',1,'29770940836','2000-05-12'),('Compras',2,'70407877843','2000-05-22'),('Desenvolvimento',3,'88542565878','2000-05-22');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependent`
--

DROP TABLE IF EXISTS `dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependent` (
  `Essn` char(11) NOT NULL,
  `Dependent_name` varchar(20) NOT NULL,
  `Gender` enum('F','M') DEFAULT NULL,
  `Bdate` date DEFAULT NULL,
  `Relationship` varchar(20) NOT NULL,
  PRIMARY KEY (`Essn`,`Dependent_name`),
  CONSTRAINT `dependent_ibfk_1` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependent`
--

LOCK TABLES `dependent` WRITE;
/*!40000 ALTER TABLE `dependent` DISABLE KEYS */;
INSERT INTO `dependent` VALUES ('15569230823','Guilherme Caldas','M','1996-02-06','filho'),('15569230823','Joana B Moreira','F','1973-07-09','cônjuge'),('23810673889','José Alberto Soares','M','1969-03-12','cônjuge'),('25359704810','Sarah L Viegas','M','1966-03-10','cônjuge'),('29770940836','Antônio J Silva','M','1991-05-12','filho'),('66777560840','Regina Pereira','F','1990-12-05','filha'),('70407877843','Rosa Figueiredo','F','1963-07-15','cônjuge'),('88542565878','Manuel G Tavares','M','1994-04-26','filho'),('89959128806','Roberta Oliveira','F','1949-09-05','filha'),('92583487884','Aline Campos','F','1970-07-18','cônjuge');
/*!40000 ALTER TABLE `dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept_locations`
--

DROP TABLE IF EXISTS `dept_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept_locations` (
  `Dnumber` int NOT NULL,
  `Dlocation` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Dnumber`),
  UNIQUE KEY `Dnumber` (`Dnumber`,`Dlocation`),
  CONSTRAINT `dept_locations_ibfk_1` FOREIGN KEY (`Dnumber`) REFERENCES `department` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept_locations`
--

LOCK TABLES `dept_locations` WRITE;
/*!40000 ALTER TABLE `dept_locations` DISABLE KEYS */;
INSERT INTO `dept_locations` VALUES (1,'Av. do Contorno'),(2,'Av. 25 de Março'),(3,'Av. Paulista');
/*!40000 ALTER TABLE `dept_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `dept_managers_vw`
--

DROP TABLE IF EXISTS `dept_managers_vw`;
/*!50001 DROP VIEW IF EXISTS `dept_managers_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dept_managers_vw` AS SELECT 
 1 AS `Department`,
 1 AS `Manager`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Fname` varchar(20) NOT NULL,
  `Minit` char(1) DEFAULT NULL,
  `Lname` varchar(20) NOT NULL,
  `Ssn` char(11) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Gender` enum('F','M') DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Super_ssn` char(11) DEFAULT NULL,
  `Dno` int DEFAULT NULL,
  `Manager` enum('Yes','No') DEFAULT NULL,
  PRIMARY KEY (`Ssn`),
  UNIQUE KEY `Ssn` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('Davi','B','Moreira','14814637802','1996-02-06','Rua F, 52, Centro','M',20000.00,'70407877843',2,'No'),('Marcela','N','Neves','15569230823','1973-07-09','Rua G, 82, Centro','F',10000.00,'29770940836',2,'No'),('Martin','E','Silveira','23810673889','1969-03-12','Rua D, 722, Centro','M',25000.00,NULL,1,'No'),('Kevin','R','Freitas','25359704810','1966-03-10','Rua H, 33, Centro','M',15000.00,'70407877843',2,'No'),('André','T','Silva','29770940836','1991-05-12','Rua A, 27, Centro','M',200000.00,NULL,1,'Yes'),('Heloísa','G','Costa','66777560840','1990-12-05','Rua J, 85, Centro','F',10000.00,'88542565878',3,'No'),('Flávia','M','Teixeira','70407877843','1963-07-15','Rua E, 71, Centro','F',35000.00,'29770940836',2,'Yes'),('Thomas','O','Porto','88542565878','1994-04-26','Rua I, 14, Centro','M',30000.00,'29770940836',3,'Yes'),('Laura','S','Fogaça','89959128806','1949-09-05','Rua C, 274, Centro','F',20000.00,NULL,1,'Yes'),('Isabela','M','Campos','92583487884','1970-07-18','Rua B, 73, Centro','F',15000.00,'89959128806',1,'No');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `employee_vw`
--

DROP TABLE IF EXISTS `employee_vw`;
/*!50001 DROP VIEW IF EXISTS `employee_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employee_vw` AS SELECT 
 1 AS `Department`,
 1 AS `Location`,
 1 AS `Employees`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employees_by_department_vw`
--

DROP TABLE IF EXISTS `employees_by_department_vw`;
/*!50001 DROP VIEW IF EXISTS `employees_by_department_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employees_by_department_vw` AS SELECT 
 1 AS `Employee`,
 1 AS `Department`,
 1 AS `Location`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employees_with_dependents_vw`
--

DROP TABLE IF EXISTS `employees_with_dependents_vw`;
/*!50001 DROP VIEW IF EXISTS `employees_with_dependents_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employees_with_dependents_vw` AS SELECT 
 1 AS `Employee`,
 1 AS `Ssn`,
 1 AS `Dependents`,
 1 AS `Manager`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `fired_employees`
--

DROP TABLE IF EXISTS `fired_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fired_employees` (
  `Fname` varchar(20) NOT NULL,
  `Minit` char(1) DEFAULT NULL,
  `Lname` varchar(20) NOT NULL,
  `Ssn` char(11) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `Gender` enum('F','M') DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL,
  `Super_ssn` char(11) DEFAULT NULL,
  `Dno` int DEFAULT NULL,
  `Manager` enum('Yes','No') DEFAULT NULL,
  PRIMARY KEY (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fired_employees`
--

LOCK TABLES `fired_employees` WRITE;
/*!40000 ALTER TABLE `fired_employees` DISABLE KEYS */;
INSERT INTO `fired_employees` VALUES ('Teste','T','Teste','12312312311',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `fired_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `Pname` varchar(20) NOT NULL,
  `Pnumber` int NOT NULL,
  `Plocation` varchar(20) DEFAULT NULL,
  `Dnum` int DEFAULT NULL,
  PRIMARY KEY (`Pnumber`),
  UNIQUE KEY `Pnumber` (`Pnumber`),
  KEY `Dnum` (`Dnum`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`Dnum`) REFERENCES `department` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('Otimiza',1,'São Paulo',1),('Avante',2,'São Paulo',2),('Impacto',3,'São Paulo',3);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `project_list_vw`
--

DROP TABLE IF EXISTS `project_list_vw`;
/*!50001 DROP VIEW IF EXISTS `project_list_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `project_list_vw` AS SELECT 
 1 AS `Project`,
 1 AS `Department`,
 1 AS `Manager`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `projects_by_employees_vw`
--

DROP TABLE IF EXISTS `projects_by_employees_vw`;
/*!50001 DROP VIEW IF EXISTS `projects_by_employees_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `projects_by_employees_vw` AS SELECT 
 1 AS `Project`,
 1 AS `Employees`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `works_on`
--

DROP TABLE IF EXISTS `works_on`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works_on` (
  `Essn` char(11) NOT NULL,
  `Pno` int NOT NULL,
  `Hours` int DEFAULT NULL,
  PRIMARY KEY (`Essn`,`Pno`),
  KEY `Pno` (`Pno`),
  CONSTRAINT `works_on_ibfk_1` FOREIGN KEY (`Essn`) REFERENCES `employee` (`Ssn`),
  CONSTRAINT `works_on_ibfk_2` FOREIGN KEY (`Pno`) REFERENCES `project` (`Pnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_on`
--

LOCK TABLES `works_on` WRITE;
/*!40000 ALTER TABLE `works_on` DISABLE KEYS */;
INSERT INTO `works_on` VALUES ('14814637802',2,45),('15569230823',2,45),('23810673889',1,30),('25359704810',2,40),('29770940836',1,100),('66777560840',3,120),('70407877843',2,90),('88542565878',3,110),('89959128806',1,85),('92583487884',1,85);
/*!40000 ALTER TABLE `works_on` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'company'
--
/*!50003 DROP PROCEDURE IF EXISTS `employee_manager_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `employee_manager_update`(in Super_ssn_p char(11), IN Ssn_p char(11))
begin
	declare exit handler for sqlexception 
	BEGIN
		rollback;
		select 'Houve um erro e não foi possível executar a ação solicitada' as Warning;
	END;
	start transaction;
	update employee set Super_ssn = Super_ssn_p where Ssn = Ssn_p;
	update employee set Manager = 'Yes' where Ssn = Super_ssn_p;
	commit;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `dept_managers_vw`
--

/*!50001 DROP VIEW IF EXISTS `dept_managers_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dept_managers_vw` AS select `d`.`Dname` AS `Department`,concat(`e`.`Fname`,' ',`e`.`Minit`,' ',`e`.`Lname`) AS `Manager` from (`department` `d` join `employee` `e` on((`d`.`Mgr_ssn` = `e`.`Ssn`))) order by `d`.`Dnumber` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_vw`
--

/*!50001 DROP VIEW IF EXISTS `employee_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_vw` AS select `d`.`Dname` AS `Department`,`dl`.`Dlocation` AS `Location`,count(`e`.`Ssn`) AS `Employees` from ((`department` `d` join `dept_locations` `dl` on((`d`.`Dnumber` = `dl`.`Dnumber`))) join `employee` `e` on((`d`.`Dnumber` = `e`.`Dno`))) group by `Department` order by `Department` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employees_by_department_vw`
--

/*!50001 DROP VIEW IF EXISTS `employees_by_department_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employees_by_department_vw` AS select concat(`e`.`Fname`,' ',`e`.`Minit`,' ',`e`.`Lname`) AS `Employee`,`d`.`Dname` AS `Department`,`dl`.`Dlocation` AS `Location` from ((`employee` `e` join `department` `d` on((`e`.`Dno` = `d`.`Dnumber`))) join `dept_locations` `dl` on((`d`.`Dnumber` = `dl`.`Dnumber`))) order by `d`.`Dnumber` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employees_with_dependents_vw`
--

/*!50001 DROP VIEW IF EXISTS `employees_with_dependents_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employees_with_dependents_vw` AS select concat(`e`.`Fname`,' ',`e`.`Minit`,' ',`e`.`Lname`) AS `Employee`,`e`.`Ssn` AS `Ssn`,count(`d`.`Dependent_name`) AS `Dependents`,`e`.`Manager` AS `Manager` from (`employee` `e` join `dependent` `d` on((`e`.`Ssn` = `d`.`Essn`))) group by `Employee` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `project_list_vw`
--

/*!50001 DROP VIEW IF EXISTS `project_list_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `project_list_vw` AS select `p`.`Pname` AS `Project`,`d`.`Dname` AS `Department`,concat(`e`.`Fname`,' ',`e`.`Minit`,' ',`e`.`Lname`) AS `Manager` from ((`project` `p` join `department` `d` on((`p`.`Dnum` = `d`.`Dnumber`))) join `employee` `e` on((`d`.`Mgr_ssn` = `e`.`Ssn`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `projects_by_employees_vw`
--

/*!50001 DROP VIEW IF EXISTS `projects_by_employees_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `projects_by_employees_vw` AS select `p`.`Pname` AS `Project`,count(`e`.`Ssn`) AS `Employees` from ((`project` `p` join `works_on` `w` on((`p`.`Pnumber` = `w`.`Pno`))) join `employee` `e` on((`w`.`Essn` = `e`.`Ssn`))) group by `Project` order by `Employees` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-18 11:04:14
