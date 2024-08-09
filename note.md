### 2024-08-05

#### hadoop command
>__hadoop fs -__ ls, mv, cat, put, get, moveFromLocal, moveToLocal, getmerge, mkdir, appendToFile

>__hadoop fsck__ 

>__hdfs dfs-__ checkSum

#### Sqoop

- Hadoop ecosystem tool

- Ingestion tool: Database to HDFS and vice versa


```
sqoop import --connect jdbc:postgresql://ec2-18-132-73-146.eu-west-2.compute.amazonaws.com:5432/testdb --username consultants -password WelcomeItc@2022 --table customer --m 1 --target-dir /user/ec2-user/UKUSJULHDFS/yesheng/customer
```

```
sqoop export --connect jdbc:postgresql://ec2-18-132-73-146.eu-west-2.compute.amazonaws.com:5432/testdb --username consultants -password WelcomeItc@2022 --table new_customer --m 1 --export-dir /user/ec2-user/UKUSJULHDFS/yesheng/customer
```

```
sqoop eval --connect jdbc:postgresql://ec2-18-132-73-146.eu-west-2.compute.amazonaws.com:5432/testdb --username consultants -password WelcomeItc@2022 --query "SELECT * FROM customer;"
```

```
sqoop import --connect jdbc:postgresql://ec2-18-132-73-146.eu-west-2.compute.amazonaws.com:5432/testdb --username consultants -password WelcomeItc@2022 --table customer --m 1 --target-dir /user/ec2-user/UKUSJULHDFS/yesheng/customer --incremental append check-column customer_id --last-value 0
```
--incremental: append (insert primary key), lastmodified (I/U/D, timestamp)


```
sqoop import --connect jdbc:postgresql://ec2-18-132-73-146.eu-west-2.compute.amazonaws.com:5432/testdb --username consultants -password WelcomeItc@2022 --table customer_replicate --m 1 --target-dir /user/ec2-user/UKUSJULHDFS/yesheng/customer --incremental lastmodified --merge-key customer_id --check-column lastchange --last-value "2024-08-07 16:30:00"
```

Hive: one table one directory.



in python 
input
df has name , place ,countrycode
dict has key as countrycode and value as countryname.

output 
dataframe must have 4 columns name , place ,countrycode, countryname 

python

df with 3 cols sourcecode,intermeidatecode,targetcode.
ABC12,SCR,ABC12_2005f
DFG,ab,345-dfg

I want output dataframe as
sourcecode,intermeidatecode,targetcode, modifiedcode
ABC12,SCR,ABC12_2005f,SCR_2005f
DFG,ab,345-dfg,ab-345


```
create external table julbatch.yesheng_new(name String, place String, countrycode String) row format delimited fields terminated by ',' stored as textfile location '/user/ec2-user/UKUSAJULHDFS/priyanshu_new' tblproperties("skip.header.line.count"="1");
```

```
 create external table julbatch.yesheng_newP(name String, place String) partitioned by (countrycode String) row format delimited fields terminated by ',' stored as textfile;
```

```
insert overwrite table julbatch.yesheng_newP select * from yesheng_new
```

```
sudo -u hdfs hadoop fs -chmod -R 777 /warehouse/tablespace/external/hive/julbatch.db/yesheng_newP
```