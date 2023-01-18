SHOW DATABASES;
USE company;
SHOW TABLES;
SELECT * FROM employee;

SET @@autocommit = 0;
SELECT @@autocommit;

-- Transações para modificação na base de dados

-- Transação em procedure
-- Atualizar os dados de um funcionário atribuindo novo gerente e atualizar o status desse gerente.
delimiter \\
CREATE PROCEDURE employee_manager_update(IN Super_ssn_p CHAR(11), IN Ssn_p CHAR(11))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
	BEGIN
		ROLLBACK;
		SELECT 'Houve um erro e não foi possível executar a ação solicitada' AS Warning;
	END;
	START TRANSACTION;
	UPDATE employee SET Super_ssn = Super_ssn_p WHERE Ssn = Ssn_p;
	UPDATE employee SET Manager = 'Yes' WHERE Ssn = Super_ssn_p;
	COMMIT;
END \\ 
delimiter ;

CALL employee_manager_update(29770940836,15569230823);