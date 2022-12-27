SHOW DATABASES;
USE sys;
SHOW TABLES LIKE 'schema%';

SELECT * FROM schema_auto_increment_columns; 
SELECT * FROM schema_index_statistics;

SELECT * FROM sys.host_summary_by_file_io;
SELECT * FROM sys.host_summary;

SHOW CREATE VIEW sys.session;

SHOW TABLES LIKE '%list';
SELECT * FROM sys.processlist;

SHOW TABLES LIKE '%session';
SELECT * FROM sys.session;

-- information schema
SHOW DATABASES;
USE information_schema;
SHOW TABLES;
SELECT * FROM information_schema.keywords;
SELECT * FROM information_schema.tables WHERE table_schema = 'ecommerce';
SELECT * FROM information_schema.CHECK_CONSTRAINTS;
SELECT * FROM information_schema.REFERENTIAL_CONSTRAINTS;
