# Start Container
---------------------------
docker-compose up -d      

# Destroy Container
---------------------------
docker-compose down      


# Recreate and Start
---------------------------
docker-compose up -d --force-recreate
docker-compose up -d --force-recreate --remove-orphans

# Check Process
---------------------------
docker-compose ps

# Connect Master
----------------------------
export PGPASSWORD="postgres"
docker exec -it postgres-master psql --host localhost --port 5432 --username postgres --dbname postgres

# Connect Slave
----------------------------
export PGPASSWORD="postgres"
docker exec -it postgres-slave psql --host localhost --port 5432 --username postgres --dbname postgres

docker exec -it postgres-slave bash
root@postgres-slave:/# psql --host postgres-master --port 5432 --username repl_user --dbname uchdatabase
psql (12.0 (Debian 12.0-2.pgdg100+1))
Type "help" for help.

uchdatabase=> 



# Test
----------------------------
\l

# Get Roles/Users
----------------------------
\du
\du+



# Connect
-----------------------
postgres=# \c uchdatabase;

# Create Table
-----------------------
CREATE TABLE student_table(
   id INT,
   student_regnum   CHAR(15) NOT NULL,
   student_fname    CHAR(25) NOT NULL,
   student_lname    CHAR(25) NOT NULL,
   student_grade    CHAR(5) NOT NULL
);

# Insert into Table
-------------------------
INSERT INTO student_table (student_regnum,student_fname,student_lname,student_grade)
VALUES ('stdsc-001', 'Tony', 'Parker', 'A');

INSERT INTO student_table (student_regnum,student_fname,student_lname,student_grade)
VALUES ('stdsc-002', 'Natasha', 'Romanov', 'B');

INSERT INTO student_table (student_regnum,student_fname,student_lname,student_grade)
VALUES ('stdsc-003', 'Mark', 'Rafalo', 'F');

INSERT INTO student_table (student_regnum,student_fname,student_lname,student_grade)
VALUES ('stdsc-004', 'Ethen', 'Hunt', 'D');

# Select
-------------------------
SELECT * FROM student_table;


# Check Replication Activity
-----------------------------------
select * from pg_stat_activity  where usename = 'repl_user';
select usename,state from pg_stat_activity where usename = 'repl_user';



echo "Starting base backup as replicator"
pg_basebackup -h postgres-master -D uchdatabase -U repl_user -vP















# Master
----------------------------------------------
DEBUG=false
POSTGRESQL_USERNAME=postgres
POSTGRESQL_PASSWORD=postgres
POSTGRES_HOST_AUTH_METHOD=trust
POSTGRESQL_PGAUDIT_LOG=READ,WRITE
POSTGRESQL_LOG_HOSTNAME=true
POSTGRESQL_REPLICATION_MODE=master
POSTGRESQL_REPLICATION_USER=repl_user
POSTGRESQL_REPLICATION_PASSWORD=repl_password
POSTGRESQL_DATABASE=uchdatabase

# Slave
-----------------------------------------------
POSTGRESQL_USER=postgres
POSTGRESQL_PASSWORD=postgres
POSTGRES_HOST_AUTH_METHOD=trust
POSTGRESQL_MASTER_PORT_NUMBER=5432
POSTGRESQL_MASTER_HOST=postgresql-master
POSTGRESQL_PGAUDIT_LOG=READ,WRITE
POSTGRESQL_LOG_HOSTNAME=true
POSTGRESQL_REPLICATION_MODE=slave
POSTGRESQL_REPLICATION_USER=repl_user
POSTGRESQL_REPLICATION_PASSWORD=repl_password




https://gist.github.com/mattupstate/c6a99f7e03eff86f170e
https://gist.github.com/JosimarCamargo/40f8636563c6e9ececf603e94c3affa7
https://bobcares.com/blog/postgres-docker-replication/
https://therishabh.in/setting-up-master-slave-replication-in-postgresql-using-dockers-and-external-volumes/
https://medium.com/@2hamed/replicating-postgres-inside-docker-the-how-to-3244dc2305be
https://www.linuxwave.info/2021/03/postgresql-13-streaming-replication.html
https://www.linkedin.com/pulse/postgresmasterslave-replica-tarunratan-panugundla
