SHOW DATABASES;
USE company;
SHOW TABLES;
SELECT * FROM employee;

SET @@autocommit = 0;
SELECT @@autocommit;

-- Transações para modificação na base de dados

-- Transação com statements
-- Atualizar os dados de um funcionário atribuindo novo gerente e atualizar o status desse gerente.
START TRANSACTION;
	UPDATE employee SET Super_ssn = 89959128806 WHERE Ssn = 92583487884;
	UPDATE employee SET Manager = 'Yes' WHERE Ssn = 89959128806;
COMMIT;
