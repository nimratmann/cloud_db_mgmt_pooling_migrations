# cloud_db_mgmt_pooling_migrations
Working with Azure and Google Cloud Platform (GCP) to manage a cloud-based MySQL database with a focus on implementing connection, pooling and performing database migrations

## Database Schema
I have defined two classes Patient and MedicalRecord for a relational database schema. The relationships between the tables can be visualized in the Entity-Relationship Diagram (ERD). In the ERD diagram screenshots for both Azure and GCP databases, you can observe the connections between the patients and medical_records tables, both linked to the patient ID number in the patient table.

## Connection Pooling Setup
1. Azure
  - Navigate to Azure Database for MySQL and click "Create" under Flexible Server.
  - Choose an existing Resource Group or create a new one.
  - Specify a server name and, in the server configuration, adjust the compute size to Standard_B1s (1 vCore, 1 GiB memory, 400 max IOPS).
  - Define a username and password for the server.
  - In the networking section, configure public access (allowed IP addresses) and set up a private endpoint.
  - Under Firewall rules, add rules for both "0.0.0.0 - 255.255.255.255" and the current client's IP address (xx.xxx.xxx.xxx), then create the instance.
  - Navigate to server parameters and set max_connections to 20 and connect_timeout to 3.

2. GCP
   - Locate SQL, initiate the instance creation process, and opt for MySQL.
   - Generate an instance ID and set a password.
   - Within the "Choose a Cloud SQL edition" section, select "Enterprise," scroll down, and modify the preset to "Sandbox."
   - In the "Customize your instance" section, opt for the "shared core" and "1 vCPU, 0.164GB" configuration.
   - Navigate to the "Connections" tab, and in the "Add a Network" section, set it to "Allow-All" with the IP address range configured as "0.0.0.0/0."
   

## Migration Process
To create a MySQL instance in either Azure or GCP and manage database migrations using Alembic, follow these steps:

1. Create a MySQL Instance:
Set up a MySQL instance on either Azure or GCP. Follow the respective cloud provider's documentation to create and configure the MySQL database. Obtain the connection details, including the database URL.

2 Create a python_migrations.py File:
In this file, establish a connection to your MySQL database using SQLAlchemy and define the data models representing your tables. If the tables already exist, include their definitions along with any new tables or modifications.

3. Initialize Alembic:
Run the following command in the terminal to initialize Alembic and create the necessary files:
`
alembic init migrations
`
4. Configure Alembic Files:
Open alembic.ini and set the sqlalchemy.url variable to equal the URL of your MySQL instance.

5. Modify env.py:
Open env.py and uncomment lines 19-20. Modify them to import the Base class from your migrations.py file, where your data models are defined.

6. Generate Migration Script:
Run the following command to generate a new migration script:
`
alembic revision --autogenerate -m "create tables"
`
7. Apply Migrations:
Execute the migration script to apply the changes to the database:
`
alembic upgrade head
`

8. Save Migration SQL Script:
If you want to save the migration as an SQL script, you can run the following command:
`
alembic upgrade head --sql > migration.sql
`

9. Check Database Changes:
Verify the changes in your MySQL database. You can use a MySQL client or command-line interface to inspect the tables and confirm that the migrations were applied successfully.



## Challenges Encountered
The biggest challenge I encountered was connecting my populate.py files with my python_migrations.py file in both GCP and Azure folders. For example, in my Azure folder, I created an azure_populate.py file to generate fake data and populate my MySQL database "mann". However, this fake data did not reflect within my patients and medical records table when I ran my app.py locally using the command `python app.py` in the Google Shell terminal. Despite successfully running the data population script for Azure (azure_populate.py), the changes made to the database, such as inserting fake data into the "patients" and "medical_records" tables, were not reflected when running my application (app.py) locally.
