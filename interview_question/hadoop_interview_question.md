Hadoop
1.	Mention Hadoop distribution? Difference between CDH and CDP
> A Hadoop distribution is a pre-configured suite of Hadoop-related software packages designed to meet specific enterprise needs. These distributions include the core Hadoop modules along with various other utilities to enhance its capabilities, such as cluster management, system monitoring, and performance optimization tools. Common Hadoop distributions include:
> 
> - Cloudera Distribution Hadoop (CDH)
> - Hortonworks Data Platform (HDP)
> - MapR
> - Amazon EMR
> - Microsoft Azure HDInsight

> CDH is a traditional on-premise Hadoop distribution focusing on integrating various big data tools, while CDP is a modern platform that merges the best of CDH and HDP.

3.	Configuration files used during hadoop installation
>
> 1. core-site.xml
>
>    This file configures Hadoop core settings, such as I/O settings that are common to HDFS and MapReduce. It includes settings like the default file
system URI (`fs.defaultFS`), which defines the URI of the filesystem to be used.
> 2. hdfs-site.xml
>
>    Specifies the configuration settings for HDFS daemons; the NameNode, the DataNode, and the Secondary NameNode. It includes configurations such as the replication factor, block size, and paths for the NameNode metadata storage.
>
> 3. mapred-site.xml
>
>    Defines settings for MapReduce jobs and for the MapReduce daemon (JobTracker and TaskTracker). It includes configurations like the framework name (`mapreduce.framework.name`), which could be set to `yarn` to use YARN for job scheduling.
>
> 4. yarn-site.xml
>
>    This file configures YARN-specific settings. It deals with the configuration of the ResourceManager, the NodeManager, and other YARN-related parameters. Key configurations might include resource allocation settings (`yarn.nodemanager.resource.memory-mb`, `yarn.nodemanager.resource.cpu-vcores`), and the address of the ResourceManager.
>
> 5. capacity-scheduler.xml (optional)
>
>    Used in YARN to configure the CapacityScheduler, which is one of the methods YARN uses to allocate system resources to various running applications based on a hierarchical queue system.
>


4.	Difference between `hadoop fs` and `hdfs dfs`?
>
> - `hadoop fs`:
>
>   This command is generic and can interact with different types of file systems that Hadoop supports, such as HDFS, local filesystem, and other Hadoop-compatible filesystems like Amazon S3, Google Cloud Storage, etc.
>
> - `hdfs dfs`
> 
>   This command is specific to Hadoop Distributed File System (HDFS). It is tailored to interact exclusively with the HDFS. 


5.	Difference between Hadoop 2 and Hadoop 3
> - Java support: Hadoop 2 uses Java 7. Hadoop 3 requires Java 8 or later.
> - Storage efficiency: Hadoop 3 introduces erasure coding, reducing storage needs by about 50%.
> - Resource management: Hadoop 3 enhances YARN with more efficient scheduling and resource utilization.
> - Scalability: Hadoop 2 supports thousands of nodes, while Hadoop 3 supports tens of thousands of nodes, improving scalability.
> - High Availability:
Hadoop 2 has a single active NameNode with standby for failover, while Hadoop 3 supports multiple active NameNodes for improved redundancy.
> - Containerization:
>   Hadoop 2 does not support Docker containers, while Hadoop 3 supports Docker, allowing applications to run in containers for better isolation and flexibility.

6.	What is replication factor ? why its important
> The replication factor in Hadoop refers to the number of copies of a file that the system stores across different nodes in the Hadoop Distributed File System (HDFS). 
>
>  This setting is crucial for ensuring data reliability, availability, and fault tolerance within a Hadoop cluster.

7.	What if Datanode fails?
>
> 1. Detection of Failure:
>
>      - Heartbeats: DataNodes send regular heartbeats to the NameNode to indicate they are functioning properly. If the NameNode stops receiving heartbeats from a DataNode for a specified duration (usually around 10 minutes), it marks the DataNode as failed.
>
> 2. Handling DataNode Failure:
>
>       - Replication Management: Once the NameNode identifies a DataNode as down, it checks the replication factor of all blocks that were stored on that failed node. If any of these blocks do not meet the desired replication factor (typically three), the NameNode initiates the replication of these blocks from other DataNodes where they are stored to other operational DataNodes. This process ensures that the replication factor is restored to the desired level, maintaining data redundancy.
>
>       - Balancing the Cluster: The system also works to rebalance the data across the remaining nodes, ensuring that data distribution remains optimal for performance and storage efficiency. This rebalance might involve moving data blocks from over-utilized DataNodes to under-utilized ones.
>
> 3. Recovery and Restart:
>
>       - DataNode Restart: In cases where the DataNode failure was due to a temporary issue (like hardware maintenance or network failures), the DataNode can usually be restarted. Upon rejoining the cluster, the DataNode starts sending heartbeats to the NameNode again, and its data blocks become available to the cluster.
>
>       - Data Integrity Checks: When a DataNode rejoins the cluster, it sends a block report to the NameNode, which contains a list of all HDFS blocks it holds. This helps the NameNode to reconcile the actual data on the cluster and update its metadata accordingly.
> 
> 4. Continuous Monitoring and Logs:
>
>       - Logs and Alerts: System administrators monitor logs and alerts that inform them of node failures, enabling them to take timely action, such as investigating hardware issues or planning capacity upgrades.
>
>       - Automated Systems: Larger deployments often use automated monitoring tools that can preemptively detect issues like disk failures or network issues before they lead to a DataNode failure.

8.	What if Namenode fails?
>
> 1. High Availability Configuration:
>
>       - Standby NameNode: Modern Hadoop clusters typically deploy a secondary or standby NameNode that maintains an up-to-date copy of the filesystem metadata. This standby NameNode is kept synchronized with the active NameNode using a JournalNode which logs all changes to the filesystem metadata. If the active NameNode fails, the standby NameNode can take over almost immediately, thereby minimizing downtime.
>       - Automatic Failover: High Availability (HA) setups usually include automatic failover mechanisms. This involves using a failover controller on each NameNode that monitors the health of the active NameNode and automatically switches to the standby in case of failure.
>
> 2. Manual Failover:
>
>       - In non-HA configurations, if the NameNode fails, a manual intervention is required to bring up a new NameNode. The new NameNode can be started on a different machine using the latest metadata backup. This process is more time-consuming and can lead to longer downtimes.
>
> 3. Metadata Backup:
>
>       - Regular backups of the NameNode metadata (fsimage and edit logs) are crucial. These backups are typically stored in a secure location and are essential for recovery in non-HA setups. In HA setups, these backups serve as an additional safety net.
>
> 4. Checkpointing:
>
>       - The Secondary NameNode or Checkpoint Node helps by periodically creating checkpoints of the filesystem metadata. These checkpoints are merged versions of the fsimage and the edit logs and help in reducing the startup time of the NameNode and the amount of data that needs to be synchronized between the active and standby NameNodes.


9.	Why is block size 128 MB ? what if I increase or decrease the block size
>
> 1. Efficient Large File Handling:
>
>       HDFS is designed for batch processing rather than interactive use. The typical files stored in HDFS are very large, often in the gigabytes or terabytes. Larger block sizes mean fewer blocks per file, which simplifies the management of these large files and reduces the overhead of managing a huge number of blocks.
>
>2. Reduced Metadata Storage:
>
>       With larger blocks, the total number of blocks that need to be managed by the NameNode decreases. Since the NameNode holds metadata about every block in memory (such as location information), larger blocks reduce the memory requirements on the NameNode. This is crucial for scalability, allowing HDFS to manage extremely large data sets efficiently.
>
> 3. Network Optimization:
>
>       Data processing tasks in Hadoop often involve reading entire blocks of data. A larger block size means that for each read operation, a substantial amount of data is processed before another network transfer is initiated. This approach minimizes the network overhead associated with each block transfer, optimizing bandwidth usage and reducing latency.
>
> 4. Disk I/O Efficiency:
>
>       Larger blocks enhance disk I/O efficiency by reducing the number of disk seeks required during read and write operations. When large blocks are used, more contiguous data is read or written in each operation, making better use of the disk’s sequential read/write capabilities.
>
>
> - Implications of Changing the Block Size:
>
>      - Increasing Block Size: Further increasing the block size might reduce the overhead on the NameNode even more and improve throughput for workloads involving extremely large files. However, it could lead to wasted storage space if many smaller files are stored, as each file occupies at least one block.
>
>      - Decreasing Block Size: Reducing the block size could increase the efficiency of storing many small files, as less space would be wasted. However, it would also increase the load on the NameNode due to the higher number of blocks and might degrade performance due to increased metadata management and more frequent disk seeks.


10.	Small file problem
>
> 1. Increased Metadata Overhead:
>
>    Each file in HDFS, regardless of its size, is represented as a separate block and has associated metadata stored in the NameNode's memory. When there are many small files, the NameNode must keep track of the metadata for each one, which can quickly consume substantial amounts of memory.
>
> 2. Inefficient Storage Utilization:
>
>    HDFS allocates a minimum of one block per file. If a file is smaller than the block size (128 MB), the remaining space in the block is left unused. This leads to poor disk space utilization, especially when the system contains millions of small files.
>
> 3. Degraded Processing Performance:
>
>    Hadoop is designed for batch processing, where each MapReduce task processes a block of data. If each small file is a separate block, Hadoop may end up spawning an excessive number of tasks for relatively small amounts of data, leading to significant overhead and reduced throughput.

11.	What is Rack awareness?
>
> Rack awareness refers to Hadoop’s ability to understand the physical layout of the cluster in terms of network topology. Specifically, it knows how the cluster's nodes are organized into racks, and the network distances between them. 
>
> The general strategy is: 
>
> 1. First Replica: Placed on the local node or somewhere else within the same rack.
> 2. Second Replica: Placed on a different node in a different rack.
> 3. Third Replica: Placed on a different node, but potentially in the same rack as the second replica.

12.	What is SPOF ? how its resolved ?

> SPOF stands for Single Point of Failure. It refers to a component or part of a system that, if it fails, will stop the entire system from working. 
>
> In the context of Hadoop, the most classic example of a SPOF used to be the NameNode. In early versions of Hadoop, the NameNode was the master server managing the file system namespace and regulating access to files by clients.

13.	Explain zookeeper?
>
> Apache ZooKeeper is an open-source server which enables highly reliable distributed coordination. It is a centralized service for maintaining configuration information, naming, providing distributed synchronization, and providing group services. All of these kinds of services are used in some form or another by distributed applications.
>
> Use Cases of ZooKeeper:
>
>
>   - Configuration Management: Centralized configuration management where configurations are stored in ZooKeeper and can be accessed and updated across all nodes in a distributed application.
>
>   - Leader Election: In distributed clusters, leader election is a common problem. ZooKeeper provides a simple way to elect a "leader" among multiple nodes to coordinate some tasks.
>
>   - Locking and Synchronization: ZooKeeper can manage locks in distributed systems, which is critical for certain operations like updates to shared resources.
>
>   - Cluster Management: Maintaining and managing the status of distributed nodes and triggering alarms or recovery processes in case of failures.
>
>   - Naming Service: Like DNS, ZooKeeper can be used for naming resolution in distributed systems to manage large datasets across clusters.

14.	Difference between -put and -CopyFromLocal?
> - `CopyFromLocal` command will help copy the file from local file system to HDFS, while the `Put` command will copy from anywhere (local or network) to anywhere (HDFS or local file system).
>
> - `Put` allows us to copy several file paths to HDFS at once (files or folders from  local or remote 
locations), while copyFromLocal, on the other hand, is limited to a local file reference.

15.	What is erasure coding?
>
> Erasure coding breaks data into multiple pieces, transforms them into a larger number of different coded pieces, and then stores the pieces across different locations or devices. When storing data, erasure coding typically divides the data into $m$ data fragments and generates $n-m$ parity fragments. The total $n$ fragments can then be stored across different servers.
>
> The key property of erasure coding is that the original data can be reconstructed from any $m$ out of the $n$ total fragments. This means if any $n−m$ fragments are lost or corrupted, the data can still be fully recovered.

16.	What is speculative execution?
> Speculative execution is a performance optimization technique used in Hadoop to improve the overall speed of processing in Hadoop MapReduce jobs. It addresses the problem of "straggler" tasks, which are tasks that take significantly longer to complete than others in the same job, often due to issues like hardware degradation, bad disks, or network problems.
>
> How Speculative Execution Works:
> 1. Monitoring Task Progress:
>
>    Hadoop continuously monitors the progress of all tasks within a job. It compares the progress of tasks against each other to identify which tasks are running slower than expected.
>
> 2. Launching Duplicate Tasks:
>
>    When the system identifies a straggler task, it doesn’t immediately kill it. Instead, it launches one or more duplicate tasks on other nodes that have available resources. These duplicate tasks do the same work as the original slow-running task.
>
> 3. Completing the Task:
>
>    The task that finishes first—whether the original or the speculative copy—wins, and its output is used. All other duplicates of that task are immediately killed once a winner is declared, freeing up their resources.

17.	Explain Yarn Architecture
>
> 1. ResourceManager (RM):
>
>    The ResourceManager is the master that manages the use of resources across the cluster. It has two main components:
>
>       - Scheduler: The Scheduler is responsible for allocating resources to the various running applications, based on constraints such as capacity, queues, and others. It performs scheduling based on the resource requirements of the applications; it does not monitor or track the status of the execution.
>       - ApplicationManager: Manages the system components that are responsible for accepting job-submissions, negotiating the first container for executing the application specific ApplicationMaster, and provides the service for restarting the ApplicationMaster container on failure.
>
> 2. NodeManager (NM):
>
>    Each NodeManager is a slave daemon on every node in the Hadoop cluster that manages the container’s lifecycle and monitoring resource usage (CPU, memory, disk, network) of each container. It reports back to the ResourceManager
> 
> 3. ApplicationMaster (AM):
>
>    The ApplicationMaster is responsible for negotiating appropriate resource containers from the Scheduler, tracking their status, and monitoring for performance. Each instance of an application (which could be a single job or a DAG of jobs) has its own instance of an ApplicationMaster. It’s responsible for the execution of a single application. The ApplicationMaster has the task of negotiating resources from the ResourceManager and working with the NodeManager(s) to execute and monitor the tasks.
>
> 4. Container:
>
>    When NodeManagers allocate resources, those resources are encapsulated in a container. The ApplicationMaster then negotiates these containers and executes specific program components within them. Containers are the execution component where the actual job logic runs.

> How YARN Works:
>
>   1. Job Submission:
>
>      The client submits a job to the ResourceManager, which forwards it to the ApplicationManager. The ApplicationManager initializes an ApplicationMaster for the job.
>   2. Resource Allocation:
>
>      The ApplicationMaster requests necessary resources from the ResourceManager’s Scheduler. The Scheduler allocates resources based on the available NodeManagers that report their health and status back to the ResourceManager.
>
>   3. Execution:
>
>      Once resources are allocated, the ApplicationMaster communicates with the corresponding NodeManagers to launch containers. The ApplicationMaster then monitors the execution and coordinates with the ResourceManager for additional resources or releasing them as tasks complete.
>
>   4. Completion:
>
>      Upon completion, the ApplicationMaster shuts down, releasing containers and resources back to the cluster.

18.	How does ApplicationManager and Application Master  differ?
>
> - Scope and Lifetime: The ApplicationManager is a permanent component of the ResourceManager that manages all applications submitted to the cluster. In contrast, each ApplicationMaster is specific to a single application and exists only for the duration of that application.
>
> - Functionality: The ApplicationManager acts as a gatekeeper and monitor at the cluster level, handling application submissions and managing ApplicationMaster instances. The ApplicationMaster, however, operates at the application level, managing the execution of individual tasks and directly interacting with the NodeManagers for container management.
>
> - Focus on Fault Tolerance: The ApplicationManager helps in maintaining high availability and reliability by managing ApplicationMaster failures and restarts. The ApplicationMaster focuses on running the application efficiently and managing resources at a granular level.

19.	Explain Mapreduce working?
>
> - Data to be processed is stored in HDFS. The input to a MapReduce job is divided into fixed-size pieces called input splits.
>
> - Each map task processes a split independently. The Map function takes a set of data, processes it, and outputs key-value pairs based on the input records.
> 
> - Once the map tasks are completed, the intermediate key-value pairs need to be sorted and then shuffled across reducers. During shuffling, data belonging to a single key (from all map outputs) is directed to the same reducer, ensuring that all values associated with the same key are brought together.
>
> - The reduce task begins after the shuffling process is complete. Each reduce function processes the keys and lists of values to produce output results.

20.	How many mappers are created for 1 GB file?
> The number of mappers created for processing a 1 GB file in a Hadoop MapReduce job primarily depends on the size of the input splits.
>
> If the input split size is set to match the block size (128 MB), then a 1 GB file would typically be divided into 8 splits.

21.	How many reducers are created for 1 GB file?
22.	What is combiner? How does it work and provide performance gain? Where did you use it 
> 
> A combiner in Hadoop MapReduce is an optional function that operates on the output of the Map phase and performs local reduction before the data is sent over the network to the Reducers. It can be thought of as a mini-reducer that processes only the data generated by one Map task.

23.	What is partitioner? How does it work and provide performance gain? Where did you use it
>
> In Hadoop MapReduce, a partitioner determines how the intermediate key-value pairs output by the Map tasks are distributed to the Reduce tasks. It plays a critical role in balancing the load among the reducers and can significantly influence the performance and efficiency of a MapReduce job.