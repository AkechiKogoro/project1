#### 1 Advantages of spark over MapReduce

- Speed: Spark provides an advanced execution engine that supports cyclic data flow and in-memory computing, which can be significantly faster than the disk-based, two-step process of MapReduce for large-scale data processing tasks. 

- Ease of Use: Spark offers high-level APIs in Java, Scala, Python, and R, making it more accessible and easier to develop complex data pipelines compared to MapReduce’s more verbose Java code. The DataFrame and Dataset APIs provide optimizations through Catalyst optimizer and Tungsten execution engine, simplifying programming complexity.

- Advanced Analytics: Beyond simple Map and Reduce operations, Spark supports SQL queries, streaming data, machine learning (MLlib), and graph processing (GraphX). These built-in libraries are consistently improved and optimized, offering a cohesive framework for a variety of data analysis needs.

- Real-Time Stream Processing: Unlike MapReduce, which is primarily designed for batch processing, Spark supports real-time stream processing. This allows for the processing of live data streams, with Spark Streaming enabling the development of scalable, high-throughput, fault-tolerant streaming applications.

- Resource Management: Spark can be run on a variety of cluster managers like Hadoop YARN, Apache Mesos, or Kubernetes, which provides flexibility in resource allocation and better cluster utilization compared to the rigid job scheduling of MapReduce.

- Fault Tolerance: Through its abstraction called Resilient Distributed Datasets (RDDs), Spark provides implicit data fault tolerance by rebuilding lost data on failure, a feature also shared with MapReduce but often more efficiently handled in Spark due to its DAG execution engine.


#### 2	Describe the architecture of Spark

1. Spark Driver

    - Role: The driver is the heart of a Spark application. It is the process running the main() function of the application and creating the SparkContext.

    - Responsibilities:

        - Converts the user program into tasks.

        - Schedules the tasks on the executors.

        - Manages the Spark job’s lifecycle and maintains an information about SparkContext.
        The driver stores the metadata about all the Resilient Distributed Datasets (RDDs) and their partitions.

2. SparkContext

    - Role: Acts as the master of the Spark application.

    - Functionality:

        - Establishes a connection to Spark execution environment (cluster mode).

        - Responsible for sending the application code to the executors.

        - Creating RDDs, accumulators, and broadcast variables on the cluster.

3. Cluster Manager

    - Types: Standalone, Apache Mesos, Hadoop YARN, or Kubernetes.

    - Functionality: Responsible for managing the cluster resources (allocating and deallocating resources to Spark applications).

4. Executors
    - Role: Executors are processes that run computations and store data for your application across the cluster.
    - Responsibilities:
        - Run the tasks assigned by the driver.
        - Report the status of the computation, back to the driver.
        - Provide in-memory storage for RDDs that are cached by user programs through Block Manager.

5. Distributed Data and Partitioning
    - Key Components:

        - RDD (Resilient Distributed Dataset): Fundamental data structure of Spark. It is an immutable distributed collection of objects, which are computed on different nodes of the cluster.

        - DataFrame and Dataset: APIs that provide optimizations over RDDs and are part of the structured data processing framework in Spark.

6. DAG Scheduler

    - Functionality: Converts RDDs into the execution graph, a series of stages divided into smaller tasks that are distributed to the executors.

7. Task Scheduler

    - Role: Responsible for sending tasks to the cluster, tracking their status, and handling retries in case of failures.

9. Block Manager
    
    - Functionality: Responsible for storing, serving, and replicating data blocks across the cluster.

#### 3	Yarn architecture


4.	What is a cluster manager? Which ones have you used?
5.	Difference between SparkContext and SparkSession 
6.	Describe spark modes to execute the program.
7.	What is dataframe and RDD. When do you use RDD over Dataframe.
8.	Transformation vs Action 
9.	Narrow transformation vs Wide transformation 
10.	What is lazy evaluation 
11.	Difference between map and flapmap
12.	What is DAG?
13.	What is lineage?
14.	Difference between DAG and Lineage?
15.	What happens when you submit a spark job 
16.	Client mode vs cluster mode ? when to use?
17.	Difference between a DF and a DS 
18.	Difference between a Pandas DF and a Spark DF 
19.	Coalesce vs repartition ? when to use ?
20.	If Coalesce and repartition can reduce the partitions then which one will you use?
21.	Scenario  when you need to reduce the partitions?
22.	When do you need to increase the partitions?
23.	What is a driver?  Example of methods that are executed on driver?
24.	What is an executor? Example of methods that are executed on executor?
25.	When would you use a broadcast join? 
26.	What is a broadcast variable? How does it work and gives performance benefit.
27.	Cache v/s persist
28.	What’s a shuffle?
29.	What is Spill? How can we use this to increase performance.
30.	Mention different ways for Spark performance tuning. Share use case, how you identified the problem, what is the problem, what is the solution.
31.	Challenges faced in spark projects you worked on?
32.	What is OOM error ? what are the possible reasons ?
33.	Difference between data partition and table partition?
34.	If both the dataset are large then how do you optimize the code?
35.	What is a logical plan vs a physical plan? 
36.	What is accumulator?
37.	Spark Streaming vs Structured Streaming 
38.	What is Dynamic Partition Pruning? 
39.	Advantages n disadvantages of big data File formats parquet, avro, csv, json.
40.	what are compression formats and its specialities
41.	Spark optimization techniques. Share use case
42.	How does Spark memory management works?
43.	How many stages and task are created.
44.	How are executors created in spark. What are the methods to identify executor size.
45.	Explain spark-submit common parameters? 
46.	What is data skew? How do you fix it? 
47.	What is key
 salting? Use case and program
48.	What is Adaptive Query Execution? 
49.	For 1 GB file how many partitions will be created. ? support your answer with practical 
50.	For any given program, how many jobs , stages and task are created.
51.	Role of checkpointing in spark and spark streaming.