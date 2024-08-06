
USE challenge2;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS customer_backup;

SET SQL_SAFE_UPDATES = 0;

CREATE TABLE customer(
	cid CHAR(10), 
    name CHAR(20), 
    email CHAR(40), 
    lastchange TIMESTAMP,
	PRIMARY KEY(cid)
);
INSERT INTO customer
(cid, name, email, lastchange)
VALUES
	('1', 'Bob', 'bob@gmail.com', CURRENT_TIMESTAMP()),
    ('2', 'Alice', 'alice@gmail.com', CURRENT_TIMESTAMP()),
    ('3', 'John', 'john@gmail.com', CURRENT_TIMESTAMP());
 
CREATE TABLE customer_backup LIKE customer;

INSERT INTO customer_backup (cid, name, email, lastchange)
SELECT cid, name, email, lastchange
FROM customer
ON DUPLICATE KEY UPDATE
    customer_backup.name = VALUES(name),
    customer_backup.email = VALUES(email),
	customer_backup.lastchange = VALUES(lastchange);

UPDATE customer
SET email = 'alice@yahoo.com', lastchange = CURRENT_TIMESTAMP()
WHERE cid = 2;

DELETE FROM customer
WHERE cid = 3;

INSERT INTO customer
(cid, name, email, lastchange)
VALUES
('4', 'Betty', 'betty@outlook.com', CURRENT_TIMESTAMP());

SELECT * FROM customer;
SELECT * FROM customer_backup;



-- -----------------------------------------------------------------------------------------------
USE challenge2;

CREATE TABLE customer_backup AS SELECT * FROM customer;

SELECT * FROM customer_backup;

UPDATE customer
SET email = 'bob@yahoo.com', lastchange = CURRENT_TIMESTAMP()
WHERE cid = 1;

SELECT * FROM customer;

DELETE FROM customer WHERE cid = 2;
    
INSERT INTO customer_backup (cid, name, email, lastchange)
SELECT cid, name, email, lastchange
FROM customer
ON DUPLICATE KEY UPDATE
    customer_backup.name = VALUES(name),
    customer_backup.email = VALUES(email),
	customer_backup.lastchange = VALUES(lastchange);
    
DELETE B
FROM customer_backup B LEFT JOIN customer C
ON B.cid = C.cid
WHERE C.cid IS NULL;
    
SELECT * FROM customer_backup;

SHOW CREATE TABLE customer;

DESCRIBE  customer_backup;