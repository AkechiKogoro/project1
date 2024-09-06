#### 1Project Descriptions:

a. Why were you brought there initially?

I was brought to Polestar to enhance the internal ticketing system and modernize the workflow management tools. The aim was to improve the overall efficiency and scalability of the software to handle growing user demands and technical requirements.

b. Current state of the app and production environment upon your arrival?

Upon my arrival, the internal ticketing system was functional but had limited capabilities for handling complex event notifications and was not scalable. The production environment mixed some Agile practices with traditional Waterfall approaches, which led to slow feature releases and difficulty in adapting quickly to changes.

c. What was the app and what does it do?

The app was an internal ticketing system used by Polestar to manage workflow and ticketing for internal operations. It handled task assignments, issue tracking, and service requests within the company, facilitating better coordination and management of internal resources.

d. Who was the end user of the app?

The end users were Polestar’s employees, primarily the engineering and support staff who managed internal operations and customer service tasks.

e. What did you specifically implement feature-wise in the app and how?

I implemented a publish-subscribe API using RabbitMQ to enable real-time notifications on ticket updates, which significantly improved response times and user engagement with the system. I also introduced a distributed Redis cache to enhance the system’s scalability and performance during peak loads.

f. What percent of time did you lead and what percent of time did you code?

My time was predominantly spent on coding (95%). I occasionally provided guidance or shared technical knowledge with peers (5%), but this was informal and not a formal part of my role.

g. What challenges did you face in the production environment and in development, and how did you address them?

One major challenge was integrating new features into the legacy system without disrupting existing functionalities. This was addressed by implementing modular development practices and extensive testing before full-scale deployment.

h. What was the size of the team and breakdown of roles?

The team consisted of about 20 members, including backend developers, frontend developers, system architects, and project managers.

i. How did you manage the day-to-day production environment, task management, and tool, documentation standards?

We used Confluence for documentation, JIRA for task management, and Git for version control. Daily stand-ups and sprint reviews helped keep the team aligned and focused on priorities.

j. What was the testing environment like? What tools and practices were used to manage sound code?

We employed a robust testing framework that included unit tests, integration tests, and performance tests, using tools like JUnit for Java and PyTest for Python. Continuous integration practices were enforced using Jenkins to manage builds and deployments.

k. What weekly standing meetings were present, who was present, and what was discussed? How did you run the scrum meeting?

Weekly meetings included sprint planning, retrospectives, and daily stand-ups with team members. Discussions focused on task progress, blockers, and planning for upcoming features. As a developer, I contributed to scrum meetings by providing updates on my tasks, discussing technical challenges, and collaborating on solutions with peers.

#### 2 Major Concepts of Tangible Contribution:

a. Tools Used:
Utilized RabbitMQ for real-time messaging, Redis for caching and scalability, and Python and C++ for development. Decisions around these technologies were based on the need for performance, scalability, and maintainability.

b. Architecture Awareness:

The system architecture was designed to be modular and scalable, accommodating new features like the publish-subscribe mechanism without significant rewrites of the existing codebase.

c. Layouts Awareness:

Although primarily backend-focused, ensured that any changes in the system architecture did not negatively impact the user interface, maintaining a seamless experience for end users.

d. Gathering Requirements:

Regular meetings with stakeholders, including IT support and project management teams, ensured that the development aligned with user needs and business goals.

e. SDLC Adherence:

Followed a clear SDLC process, incorporating requirements gathering, design, coding, testing, deployment, and maintenance phases, with regular reviews and updates to stakeholders.

f. QA Strategies:

Implemented a comprehensive QA strategy that included automated and manual testing to ensure that new features were robust and reliable.

3. Example of Technical Failure:

Once, a deployment led to performance bottlenecks due to unoptimized Redis usage, which was quickly rectified by adjusting the caching strategy and adding more nodes to the cluster. This incident underscored the importance of load testing and capacity planning in my future projects.

4. Project Overview:

Why Hired: To improve and scale the internal ticketing system. 

Status at Time: Existing system was functional but limited. 

Team Collaboration: Worked closely with a multidisciplinary team to integrate new technologies and practices. 

Skills/Tech Used: RabbitMQ, Redis, Python, C++, Splunk, and Grafana. 

Issues Resolved: Enhanced system scalability and user engagement with real-time updates. 

Deliverables: Upgraded ticketing system, new API functionalities, and improved system monitoring tools.