DROP TABLE IF EXISTS customer_backup;
DROP TABLE IF EXISTS customer;

CREATE TABLE IF NOT EXISTS customer (
	cid SERIAL PRIMARY KEY,
	name VARCHAR(60),
	email VARCHAR(200),
	lastChange TIMESTAMP
); 


CREATE TABLE IF NOT EXISTS customer_backup (LIKE customer INCLUDING ALL);




CREATE OR REPLACE FUNCTION backup_update()
RETURNS TRIGGER AS $$
BEGIN
	MERGE INTO customer_backup AS B
	USING customer AS C
	ON B.cid = C.cid
	WHEN MATCHED THEN
	UPDATE SET name = C.name, email = C.email, lastChange = C.lastChange
	WHEN NOT MATCHED THEN
	INSERT (cid, name, email, lastChange)
	VALUES (C.cid, C.name, C.email, C.lastChange);
RETURN NEW;
END; $$ LANGUAGE plpgsql;

CREATE TRIGGER upsert_backup_trigger
AFTER INSERT OR UPDATE ON customer
FOR EACH ROW
EXECUTE FUNCTION backup_update();


CREATE OR REPLACE FUNCTION backup_delete()
RETURNS TRIGGER AS $$
BEGIN
	DELETE FROM customer_backup WHERE cid = OLD.cid;
	RETURN OLD;
END; 
$$ LANGUAGE plpgsql;

CREATE TRIGGER delete_backup_trigger
AFTER DELETE ON customer
FOR EACH ROW
EXECUTE FUNCTION backup_delete();

INSERT INTO customer (cid, name, email, lastChange)
VALUES
	('1', 'Bob', 'bob@gmail.com', CURRENT_TIMESTAMP),
	('2', 'Alice', 'alice@gmail.com', CURRENT_TIMESTAMP),
	('3', 'John', 'john@gmail.com', CURRENT_TIMESTAMP);

-- SELECT * FROM customer;

SELECT * FROM customer_backup;

SELECT * FROM customer;

UPDATE customer
SET email = 'alice@yahoo.com', lastchange = CURRENT_TIMESTAMP
WHERE cid = 2;

DELETE FROM customer
WHERE cid = 3;