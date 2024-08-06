### 2024-08-05

#### hadoop command
>__hadoop fs -"__ ls, mv, cat, put, get, moveFromLocal, moveToLocal, getmerge, mkdir, appendToFile

>__hadoop fsck__ 

>__hdfs dfs-__ checkSum

14:14:27	INSERT INTO customer_backup (cid, name, email, lastchange) SELECT * FROM customer ON DUPLICATE KEY UPDATE  name = VALUES(name),     email = VALUES(email),     lastchange = VALUES(lastchange)	3 row(s) affected, 3 warning(s): 

1287 'VALUES function' is deprecated and will be removed in a future release. Please use an alias (INSERT INTO ... VALUES (...) AS alias) and replace VALUES(col) in the ON DUPLICATE KEY UPDATE clause with alias.col instead 

1287 'VALUES function' is deprecated and will be removed in a future release. Please use an alias (INSERT INTO ... VALUES (...) AS alias) and replace VALUES(col) in the ON DUPLICATE KEY UPDATE clause with alias.col instead 


1287 'VALUES function' is deprecated and will be removed in a future release. Please use an alias (INSERT INTO ... VALUES (...) AS alias) and replace VALUES(col) in the ON DUPLICATE KEY UPDATE clause with alias.col instead Records: 3  Duplicates: 0  Warnings: 3	0.000 sec

'CREATE TABLE `customer` (
  `cid` char(10) NOT NULL,
  `name` char(20) DEFAULT NULL,
  `email` char(40) DEFAULT NULL,
  `lastchange` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci'

Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'SELECT * FROM customer_backup' at line 6
