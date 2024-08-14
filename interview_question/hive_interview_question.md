Hive 
1.	Difference between Data warehouse and database?
> 
> - Purpose:
>
>      - Database: Designed to handle day-to-day operations and transactions in real-time. It is optimized for tasks like reading, writing, updating, and deleting data quickly, which are common in everyday business activities.
>
>      - Data Warehouse: Built to handle complex queries and analysis. It is optimized for read-intensive operations and is used for reporting and data analysis. Data warehouses support business decisions by consolidating data from multiple sources.
>
>- Data Structure:
>
>    - Database: Often normalized, which means the data is organized to reduce redundancy and improve integrity through separate but related tables. This structure is beneficial for operational efficiency and speed.
>
>    - Data Warehouse: Typically structured in a denormalized format. It uses schemas like star schema or snowflake schema that streamline complex queries but can lead to redundancy. This setup is intended to improve query performance and ease of use for analysis purposes.
>
>- Data Updates:
>
>   - Database: Data is frequently updated or deleted. The operations reflect the ongoing transactions within the business.
>
>   - Data Warehouse: Primarily used for data analysis and often loaded with large batches of data at scheduled times. It is less about ongoing updates and more about periodic refreshes to include new aggregated or historical data.

2.	Difference between Data warehouse and data mart?
>
> A data mart is a specialized and focused subset of a data warehouse, designed to cater to the specific analytical needs of a particular business unit, department, or user group within an organization. Unlike a data warehouse, which serves as a centralized repository for the entire enterprise, a data mart hones in on a specific subject area or use case.
>
> - Size: In terms of data size, data marts are generally smaller, typically encompassing less than 100 GB. In contrast, data warehouses are much larger, often exceeding 100 GB and even reaching terabyte-scale or beyond.
>
> - Range: Data marts cater to the specific needs of a single line of business or department within the organization. On the other hand, data warehouses are designed to be enterprise-wide, spanning across multiple functional areas and serving the data requirements of the entire organization.
>
> - Sources: Data marts draw data from a limited number of sources, while data warehouses have a more comprehensive scope, collecting data from a diverse array of sources.. Data warehouses integrates information from numerous operational systems, applications, and external feeds to offer a holistic and comprehensive view of the organization's data landscape.
>
>
3.	Difference between OLTP vs OLAP?
>
> Online analytical processing (OLAP) and online transactional processing (OLTP) are the two primary data processing systems used in data science. The key difference between OLAP and  OLTP is that OLAP is used for complex data analysis, while OLTP is used for real-time processing of online transactions at scale. 
>
> Simply put, organizations use OLTP systems to run their business while OLAP systems help them understand their business. 
> 
> - Updates and backups
>
>   OLAP systems are designed to process queries that include thousands to millions of rows of data. Data is updated hourly to daily depending on the needs of the organization. In contrast, OLTP systems typically update a few rows of data at a time in real time or near real time. OLTP systems are also backed up much more frequently than OLAP systems.
>
> - Speed
>
>   By definition, OLTP systems have response times that are measured in milliseconds. OLAP databases process significantly more data, so their response times are slower. 
>
> - Data storage capacity
>
>   Providing that historical transaction data is archived, OLTP systems have relatively modest data storage requirements. In contrast, OLAP systems require massive amounts of data storage capacity to function.

4.	Why hive metadata is stored in SQL?
>
> Hive stores its metadata in a relational database like MySQL, PostgreSQL, or Oracle for several key reasons related to its architecture, functionality, and performance:
>
> 1. Relational Database Schema: Hive's metadata, which includes information about tables, columns, data types, partitions, and more, fits well into a structured schema that a relational database can effectively manage.
>
> 2. Robust Management: Relational databases are proven systems for managing large volumes of structured data with high reliability and consistency.
>
> 3. ACID Properties: SQL databases support atomicity, consistency, isolation, and durability (ACID) properties, which are crucial for transaction management.
>
> 4. Query Optimization: SQL databases provide sophisticated mechanisms for querying and indexing, which make metadata operations faster and more efficient. 
>
> 5. Integration with Other Tools: By storing metadata in a SQL database, Hive can leverage existing database tools and technologies for maintenance, backups, replication, and more. 
>
> 6. Backup Solutions: SQL databases have mature tools and processes for backup and recovery.
>
> 7. Multiple Users: A SQL database can handle multiple concurrent sessions efficiently, managing read and write operations without data corruption.

5.	Which SQL is the default database for hive?
>
> The default database for storing Hive metadata is Apache Derby.

6.	What is managed table?
>
> In Hive, a managed table, also known as an internal table, is a type of table where Hive has full control over the lifecycle and data of the table. This means that Hive manages both the data storage and the metadata. 

7.	What is external table?
>
> In Hive, an external table is a type of table that gives Hive the ability to manage the metadata of the table while the data itself is stored outside of Hive's control. This setup is particularly useful for situations where data needs to be shared with other systems or persists independently of the Hive environment. 

8.	When do we use external table?
>
> External tables are useful when you need to use Hive to process data that must also be available to other applications outside of Hive. For instance, data generated by another process that persists in a shared location can be accessed via Hive without the need for data duplication.

9.	Difference between managed and external table?
>
> 1. Data Ownership:
>
>    Managed Table: Hive controls both the data and the metadata. Deleting the table in Hive also deletes the underlying data from the file system.
>
>    External Table: Hive manages only the metadata, not the data. Deleting the table leaves the data intact in the file system.
>
> 2. Data Storage Location:
>
>    Managed Table: Data is stored in a Hive-specified directory within the Hive warehouse directory on HDFS.
>
>    External Table: Data can be stored in any location on HDFS or other storage systems that the user specifies.
>
> 3. Data Lifecycle:
>
>    Managed Table: The lifecycle of the data is tied to the Hive table. If the table is dropped, the data is also deleted.
>
>    External Table: The data lifecycle is independent of Hive. Data persists even after the Hive table is deleted.
>
> 4. Use Case Suitability:
>
>    Managed Table: Best suited for scenarios where Hive is the sole data user, or when data privacy and security are tightly controlled within Hive.
>
>    External Table: Ideal for scenarios where data needs to be shared with other systems or applications outside of Hive, or when data is sourced from processes not controlled by Hive.

10.	What happens if you don’t provide location to external table?
> 
>  Typically, Hive behaves in one of two ways:
>
> 1. Default Warehouse Location:
>
>    Hive may use the default warehouse directory to store the data files associated with the external table. This default location is usually something like `/user/hive/warehouse`. However, because the table is defined as external, Hive still treats the data as external.
>
> 2. Error or Warning:
>
>    Some configurations of Hive might issue a warning or even an error if a location is not specified for an external table, insisting that the user must explicitly define where the data for an external table is stored. 

11.	Performance optimization in hive?
>
> 1. Cost-Based Optimizer (CBO):
>
>    Hive uses a Cost-Based Optimizer that helps in choosing the most efficient query execution plan based on the cost of different query operations. It uses table and column statistics to make better decisions about join order, join type, map-reduce stages, and more.
>
> 2. Tez Execution Engine:
>
>    Apache Tez is an execution framework that allows for complex directed-acyclic-graph (DAG) of tasks for processing data. Hive on Tez is more performant compared to the traditional MapReduce engine, especially for interactive query scenarios where speed is critical.
>
> 3. Vectorization:
>
>    This feature allows Hive to process a batch of rows together instead of one row at a time. By processing records in batches, vectorization significantly reduces the CPU usage due to fewer instructions and better cache usage, thus speeding up data processing.
>
> 4. Partitioning and Bucketing:
>
>    - Partitioning: Hive tables can be partitioned by one or more keys that divide the table into different parts based on the value of partitioned columns. This can greatly enhance performance by limiting the amount of data scanned during query execution.
>
>    - Bucketing: Divides data into manageable chunks or buckets based on a hash function. When combined with partitioning, it can further enhance performance, particularly for queries that involve joins or aggregations.
>
> 5. Materialized Views:
>
>    Hive supports materialized views which pre-compute and store the result of a complex query. Subsequent queries can use these pre-computed results to achieve lower latency and reduced load on the execution engines.
>
> 6. Indexing:
>
>    Indexes can be created on Hive tables to allow faster lookups to speed up query performance. However, the use of indexing in Hive is not as prevalent due to the overhead of maintaining the indexes.
>
> 7. ORCFile Format:
>
>    Optimized Row Columnar (ORC) format is a highly efficient way to store Hive data. It offers a highly optimized way to read, write, and process data. It includes features like columnar storage, compression, and encoding schemes that dramatically decrease the amount of data read during queries.
>
> 8. Dynamic Partition Pruning:
>
>    This optimization helps in reducing the amount of data scanned during the execution of a query that uses partitioned tables. It dynamically determines which partitions need to be accessed based on the query conditions and only scans the relevant partitions.
>
> 9. LLAP (Live Long and Process):
>
>    Hive LLAP (Low Latency Analytical Processing) enables fast, interactive query performance. It maintains persistent server instances that can cache data and provide processing power, significantly reducing query latency.
> 10. Query Result Cache:
>
>     Introduced in recent versions of Hive, this feature caches the results of previous queries so that the same query can return instant results by fetching data from the cache instead of executing the query again.

12.	Explain partitioning? Where did you use with example
>
> When you create a partitioned table in Hive, you specify one or more table columns as partition columns. Hive then creates a separate directory for each unique value of the partition column(s), and all data corresponding to a particular column value is stored in the respective directory.

13.	Explain bucketing? Where did you use with example
>
> When you create a bucketed table in Hive, you specify the columns on which to bucket and the number of buckets. Hive uses a hash function on the bucketing column to distribute the data across a fixed number of buckets. Each bucket is stored as a separate file in the table's directory in HDFS.

14.	Explain transactional table and implement merge to load incremental data.
>
> A transactional table in Hive refers to a table that supports ACID (Atomicity, Consistency, Isolation, Durability) properties, enabling it to handle row-level insert, update, and delete operations. 

- Configurations:

```
SET hive.support.concurrency = true;
SET hive.enforce.bucketing = true;
SET hive.exec.dynamic.partition.mode = nonstrict;
SET hive.txn.manager = org.apache.hadoop.hive.ql.lockmgr.DbTxnManager;
SET hive.compactor.initiator.on = true;
SET hive.compactor.worker.threads = 1;
```

- Create a transactional table:
```
CREATE TABLE account_transactions (
    transaction_id INT,
    account_id INT,
    amount DECIMAL(10,2),
    transaction_date DATE
)
CLUSTERED BY (account_id) INTO 10 BUCKETS
STORED AS ORC
TBLPROPERTIES ('transactional'='true');
```

- Example: merge incremental data:
```
MERGE INTO transactions t
USING transactions_staging s
ON t.id = s.id
WHEN MATCHED THEN
    UPDATE SET t.amount = s.amount, t.transaction_date = s.transaction_date
WHEN NOT MATCHED THEN
    INSERT VALUES (s.id, s.amount, s.transaction_date);
```