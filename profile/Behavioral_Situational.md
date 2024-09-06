#### 1 Tell me about a time you’ve had to help rebuild a production environment, from the ground up – reoptimizing the technologies and the SDLC practices.

- Situation: At Huntington Bancshares Inc., I was tasked with rebuilding a legacy production environment that was no longer scalable or efficient.

- Task: My role was to rearchitect the entire system, optimizing both the underlying technologies and the software development lifecycle (SDLC) practices to meet modern standards.

- Action: I began by conducting a thorough analysis of the existing environment, identifying bottlenecks and inefficiencies. I recommended migrating to a cloud-based solution on GCP, leveraging Kubernetes for container orchestration and Terraform for infrastructure as code (IaC). Simultaneously, I introduced Agile practices and implemented a CI/CD pipeline using Jenkins and GitLab CI to automate deployment and testing.

- Result: The new environment not only improved system performance and scalability but also reduced deployment times by 60%. The adoption of Agile practices increased team productivity and enhanced the overall quality of the delivered software.

#### 2 Tell me about a time you had to make recommendations to stakeholders, as well as requirement gathering.

- Situation: While at AbbVie Inc., I was involved in a project to develop a data analytics platform for monitoring adverse event reports.

- Task: My task was to gather requirements from various stakeholders, including data scientists and regulatory experts, and to provide recommendations on the platform's architecture and tools.

- Action: I conducted several workshops to gather requirements, ensuring that I fully understood the needs of each stakeholder. I then recommended the use of AWS Glue for ETL processes, Snowflake for data warehousing, and Airflow for workflow automation. I also emphasized the importance of data security and compliance, recommending the use of AWS IAM and KMS for access control and encryption.

- Result: The recommendations were well-received, and the platform was successfully implemented, meeting all stakeholder requirements. The system provided real-time insights and enhanced the company's ability to monitor and respond to safety signals.

#### 4 Tell me about a time you’ve had to institute a heavy TDD and other sound testing practices.

- Situation: During my time at LeafLink, I noticed that the development team lacked a robust testing framework, which was leading to frequent bugs in production.

- Task: I was responsible for instituting a Test-Driven Development (TDD) approach to improve code quality and reliability.

- Action: I introduced TDD practices, using tools like ScalaTest for unit testing and Jenkins for continuous integration. I also conducted training sessions to ensure that all team members were comfortable with the new approach. We established a comprehensive testing pipeline, including unit tests, integration tests, and automated end-to-end tests.

- Result: The introduction of TDD reduced production bugs by 40% and improved overall code quality. The team became more confident in their code, and the time spent on debugging in production decreased significantly.

#### 4 Tell me about a time you’ve had to refactor code from Obj-C to Swift or Java to Kotlin.

- Situation: At Polestar, we had a legacy ticketing system built in Objective-C that needed modernization to improve performance and maintainability.

- Task: I was tasked with refactoring the system from Objective-C to Swift.

- Action: I began by identifying the critical components of the system and planning the refactor in phases to minimize disruptions. I ensured that we had comprehensive test coverage before starting the refactor to catch any regressions. I then refactored the code, improving the architecture and performance by taking advantage of Swift's modern features.

- Result: The refactored system was more maintainable and performed 30% better. The transition to Swift also made the codebase more accessible to new developers, speeding up onboarding and reducing development time for new features.

#### 5 Tell me about a time you’ve used multithreading in a project.

- Situation: At Constellation Energy Corporation, I worked on a project where we needed to process large volumes of real-time data from smart meters across the grid.

- Task: My role was to ensure that the data processing system could handle high throughput and low latency.

- Action: I implemented a multithreaded solution using Apache Spark, which allowed us to process data in parallel across multiple nodes. I also optimized the thread management and memory usage to prevent bottlenecks and ensure smooth operation.

- Result: The multithreaded approach allowed us to process millions of data points per second, significantly improving the system's efficiency and enabling real-time analysis of the grid's performance.

#### 6 Tell me about a time when you’ve worked in a smaller, more agile production environment and a time when you’ve worked in a very large, robust production environment with many moving parts and standard operating procedures/protocols.

- Situation: At LeafLink, I worked in a smaller, agile environment, while at Huntington Bancshares Inc., I operated within a large, complex production environment.

- Task: My task at LeafLink was to rapidly develop and deploy features in a fast-paced environment, while at Huntington Bancshares Inc., I needed to navigate through multiple layers of protocols to implement changes.

- Action: In the agile environment at LeafLink, I leveraged tools like Jenkins for rapid CI/CD and maintained close communication with the team to ensure swift iterations. At Huntington Bancshares Inc., I followed strict protocols, ensuring all changes were thoroughly documented and reviewed through several stages before deployment.

- Result: At LeafLink, we achieved a 20% increase in feature deployment speed, while at Huntington, the meticulous process ensured zero production incidents over a 12-month period.

#### 7 Tell me about a time you’ve had to perform an architecture switch or migration.

- Situation: While at Oscar Health, the team decided to migrate from an on-premises Hadoop cluster to a cloud-based solution on AWS.

- Task: I was responsible for planning and executing the migration with minimal downtime.

- Action: I conducted a thorough analysis of the existing architecture and mapped out a migration plan that included the use of AWS EMR for Hadoop workloads and S3 for storage. We implemented the migration in phases, starting with non-critical workloads, and gradually moved to more essential services.

- Result: The migration was completed with only 2 hours of planned downtime, and the new architecture on AWS resulted in a 50% reduction in operational costs and a 30% increase in processing speed.

#### 8 What piece of work are you most proud of and why?

- Situation: At Huntington Bancshares Inc., I led the development of a data governance platform on GCP.

- Task: The task was to ensure that data across the organization was secure, compliant, and accessible to authorized users.

- Action: I designed and implemented a comprehensive data governance framework using GCP tools like BigQuery and IAM. I also automated the enforcement of data policies using Cloud Functions and implemented real-time monitoring with Stackdriver.

- Result: The platform significantly improved data security and compliance, earning recognition from senior management for its impact on the company's data strategy.

#### 9 How do you manage teams and what were the roles and breakdown of numbers of those teams?

- Situation: At AbbVie Inc., I managed a team of 25 people, including data engineers, data scientists, and DevOps specialists.

- Task: My role was to lead the team in developing and deploying Big Data analytics solutions on AWS.

- Action: I implemented Agile methodologies, organized regular stand-ups, and ensured clear communication across all team members. I focused on empowering team members to take ownership of their work while providing mentorship and guidance.

- Result: The team consistently met project deadlines, and the collaborative environment led to innovative solutions that improved our analytics capabilities.

#### 10 Where were these teams based? – Any remote team members? Select one of your projects to base your answer on.

- Situation: During my time at Huntington Bancshares Inc., my team was primarily based in Columbus, Ohio, with a few members working remotely from different parts of the country.

- Task: My task was to manage the team effectively despite the geographical separation.

- Action: I leveraged tools like Slack and Zoom for communication and collaboration, and I implemented a clear set of guidelines for remote work to ensure consistency in our processes. Regular check-ins and virtual meetings were crucial in maintaining team cohesion.

- Result: The remote team members integrated seamlessly into the workflow, and we maintained high productivity levels throughout the project.

#### 11 Tell me about a time you did not deliver timely, why, and what was done about it for the future.

- Situation: At LeafLink, we were working on a tight deadline to launch a new analytics feature, but we encountered unexpected delays due to integration issues with Azure Synapse.

- Task: I was responsible for ensuring the timely delivery of the feature.

- Action: When it became clear that we would not meet the deadline, I communicated the delay to the stakeholders immediately, explaining the issues and providing a revised timeline. I then worked with the team to identify the root causes and implemented changes in our integration testing procedures to catch such issues earlier in the future.

- Result: Although we delivered the feature one week late, the proactive communication and subsequent process improvements were appreciated by the stakeholders, and we avoided similar delays in the future.

#### 12 What is your strength?

- Situation: One of my greatest strengths is my ability to quickly adapt to new technologies and environments.

- Task: This strength has allowed me to thrive in dynamic settings where the technology stack and requirements frequently change.

- Action: For example, at Huntington Bancshares Inc., I was able to rapidly learn and implement new GCP services to optimize our data pipelines, which significantly improved performance.

- Result: This adaptability has consistently enabled me to deliver high-quality solutions in fast-paced and evolving environments.

#### 13 What is your weakness?

- Situation: I tend to be overly detail-oriented, which sometimes slows down my decision-making process.

- Task: I’ve recognized that this can be a hindrance in fast-paced environments.

- Action: To address this, I’ve been working on balancing my attention to detail with the need for speed, especially by setting clear priorities and deadlines for myself.

- Result: This approach has helped me maintain high-quality work without sacrificing efficiency.

#### 14 What is the greatest challenge you have experienced in your past?

- Situation: One of the greatest challenges I faced was during the architecture migration at Oscar Health, where we had to move a massive amount of data to the cloud with minimal downtime.

- Task: My responsibility was to ensure that the migration was seamless and did not disrupt critical operations.

- Action: I meticulously planned the migration, coordinated with all relevant teams, and conducted multiple dry runs to ensure everything would go smoothly on the day of the migration.

- Result: Despite the complexity, the migration was successful with only a brief period of downtime, and it resulted in significant performance improvements.

#### 15 Talk about your leadership philosophy/style.

- Situation: My leadership philosophy is centered around empowering my team members and fostering a collaborative environment.

- Task: At AbbVie Inc., I was responsible for leading a large team of data engineers and scientists.

- Action: I focused on creating an environment where team members felt ownership of their work and encouraged open communication and innovation. I provided mentorship and support while allowing team members the freedom to experiment and grow.

- Result: This approach led to high team morale and productivity, and we consistently delivered innovative solutions that met or exceeded expectations.

#### 16 What is your proudest moment in your past?

- Situation: My proudest moment was when my team at AbbVie Inc. successfully deployed a Big Data analytics platform that significantly improved our ability to monitor pharmacovigilance data.

- Task: My task was to lead the development and deployment of this platform.

- Action: I worked closely with the team, guiding them through challenges and ensuring that we stayed on track despite tight deadlines.

- Result: The platform was a resounding success, and it was recognized by senior management for its impact on the company's operations.

#### 17 Talk about a conflict you’ve had with a previous peer, and how did you overcome this conflict?

- Situation: At Polestar, I had a conflict with a peer over the implementation of a new API feature.

- Task: My task was to find a resolution that aligned with the project's goals and deadlines.

- Action: I initiated a candid conversation with my peer, where we discussed our differing perspectives and concerns. I focused on finding common ground and collaboratively brainstorming a solution that addressed both our concerns.

- Result: We reached a compromise that improved the API's performance and stability, and the experience strengthened our working relationship.

#### 18 How did you get into your respective technology?

- Situation: My interest in Big Data began during my time at Fudan University, where I studied Mathematics.

- Task: I became fascinated with how data could be used to solve complex problems, which led me to explore data engineering.

- Action: After completing my Ph.D. at UC San Diego, I pursued roles that allowed me to dive deep into Big Data technologies, starting with my work at Oscar Health.

- Result: Over the years, I’ve developed extensive expertise in Big Data and cloud technologies, which has become the core of my professional career.

#### 19 What do you like about our app?

- Situation: After reviewing your app, I’m particularly impressed with its user-friendly interface and the seamless integration of various features.

- Task: My task is to provide an assessment based on my expertise.

- Action: I appreciate how your app simplifies complex tasks and provides users with clear and actionable insights. The design is intuitive, and the performance is robust, which reflects a well-thought-out architecture.

- Result: Overall, your app stands out for its user experience and the technical excellence that supports it.

#### 20 What would you improve about our app?

- Situation: While your app is impressive, I noticed that the data load times could be optimized.

- Task: My task is to provide constructive feedback for improvement.

- Action: I would recommend optimizing the data processing pipeline, possibly by incorporating a more efficient caching mechanism or by optimizing the backend queries.

- Result: These improvements could enhance the user experience by making the app even more responsive.

#### 21 Are you doing any personal projects? With or without a team?

- Situation: Currently, I’m working on a personal project to develop a data analytics platform that integrates with IoT devices.

- Task: My task is to build a scalable solution that can process and analyze data in real-time.

- Action: I’m using a combination of AWS services, including Lambda, Kinesis, and Redshift, to build this platform. I’m working independently but collaborating with a few peers for feedback and testing.

- Result: The project is still in development, but it’s providing me with valuable insights into the latest technologies and practices.

#### 22 How many apps have you developed?

- Situation: Throughout my career, I’ve contributed to the development of several apps and platforms across different companies.

- Task: My task has varied from designing the architecture to leading the development of these applications.

- Action: Notably, I’ve been involved in the development of a pharmacovigilance platform at AbbVie Inc., an internal ticketing system at Polestar, and various analytics platforms at LeafLink and Huntington Bancshares Inc.

- Result: These apps have had a significant impact on the companies’ operations, providing robust solutions to complex problems.

#### 23 If I could create an ideal role here, ignoring the JD, what would it be?

- Situation: Based on my expertise, an ideal role for me would involve leading the development of large-scale data platforms that integrate cutting-edge technologies.

- Task: My task would be to architect and implement solutions that drive innovation and efficiency.

- Action: I would focus on leveraging cloud services, Big Data technologies, and machine learning to develop platforms that provide actionable insights and support strategic decision-making.

- Result: This role would align with my passion for solving complex problems and driving technological advancement.

#### 24 If you came in and talked with the team, what would you need to hear to walk away from that interview with enthusiasm for the position?

- Situation: For me to walk away with enthusiasm, I would need to hear that the team is committed to innovation and continuous learning.

- Task: My task is to assess whether the company’s values align with mine.

- Action: I would be excited to hear about ongoing projects that push the boundaries of technology, a collaborative culture, and a clear commitment to professional development.

- Result: If these elements are present, I would be enthusiastic about the opportunity to contribute to and grow with your team.

#### 25 Tell me about a recent challenge you’ve dealt with?

- Situation: A recent challenge I faced was optimizing a data pipeline at Huntington Bancshares Inc. that was struggling with performance issues.

- Task: My task was to identify the bottlenecks and implement a solution that would improve throughput and reduce latency.

- Action: I conducted a detailed analysis and determined that the issue was due to inefficient data partitioning. I restructured the data pipeline, optimized the partitions, and implemented caching mechanisms to enhance performance.

- Result: The optimizations led to a 40% improvement in data processing speed, significantly enhancing the overall system performance.

#### 26 Do you usually work with large or small companies?
- Situation: Throughout my career, I’ve worked with both large organizations like AbbVie Inc. and Huntington Bancshares Inc., as well as smaller companies like LeafLink and Polestar.

- Task: My task has been to adapt to the unique challenges of each environment.

- Action: In larger organizations, I’ve focused on navigating complex protocols and large-scale operations, while in smaller companies, I’ve enjoyed the agility and close collaboration that comes with a smaller team.

- Result: My experience in both settings has equipped me with the flexibility to thrive in any environment.

#### 27 What are you looking for?

- Situation: I’m looking for a role that allows me to leverage my expertise in Big Data and cloud technologies to drive innovation and solve complex problems.

- Task: My task is to find an opportunity where I can make a significant impact and continue to grow professionally.

- Action: I’m particularly interested in environments that value continuous learning, collaboration, and the application of cutting-edge technologies.

- Result: Such a role would enable me to contribute effectively while also advancing my own skills and knowledge.

#### 28 What leadership experience do you have?

- Situation: I have extensive leadership experience from my roles at AbbVie Inc., Huntington Bancshares Inc., and other companies.

- Task: My task has been to lead teams in developing and deploying complex data platforms.

- Action: I’ve implemented Agile methodologies, mentored team members, and fostered a collaborative environment that encourages innovation and accountability.

- Result: Under my leadership, teams have consistently delivered high-quality solutions on time and within budget, contributing to the success of various projects.

#### 29 What is the most challenging feature you have worked on?

- Situation: One of the most challenging features I worked on was implementing real-time data streaming and analysis at Huntington Bancshares Inc.

- Task: The task was to develop a system that could process and analyze large volumes of real-time data with minimal latency.

- Action: I leveraged Kafka for data streaming and integrated it with Spark for real-time processing. I also implemented optimized data pipelines to handle the high throughput.

- Result: The feature was successfully deployed and became a critical component of the company’s analytics infrastructure, enabling real-time insights that informed business decisions.

#### 30 Are you an independent contractor or are you linked to a company?

- Situation: I am currently linked to a consultancy company, which deploys me to various end clients.

- Task: My task is to deliver high-quality solutions to these clients while maintaining a strong relationship with my consultancy.

- Action: I ensure that I remain focused on my consultancy’s objectives while also meeting the specific needs of the end clients.

- Result: This arrangement allows me to leverage the support and resources of my consultancy while delivering value to a variety of organizations.