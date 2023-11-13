# cloud_db_mgmt_pooling_migrations
Working with Azure and Google Cloud Platform (GCP) to manage a cloud-based MySQL database with a focus on implementing connection, pooling and performing database migrations

## Database Schema
I have defined two classes Patient and MedicalRecord for a relational database schema. The relationships between the tables can be visualized in the Entity-Relationship Diagram (ERD). In the ERD diagram screenshots for both Azure and GCP databases, you can observe the connections between the patients and medical_records tables, both linked to the patient ID number in the patient table.

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
