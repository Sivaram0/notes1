what is sga ?
What is instance ?
What is database ?
what is database server?
What are the manditory background processes in Oracle ?
What happens when you kill the manditory background processes ?
How to check how many databases are up and running on the server?
How to check the version and bit version of oracle software?
How to check how many databases are configured on the server?
How to start the database if pfile is not in default location?
What is the difference between ORACLE_BASE and ORACLE_HOME?
What is the use of oratab file?
How do you check if oracle software installed on a server?
==========================
What is  Oracle database's physical and logical structure ?
What is the use of Control files ?
What is the difference between SPFILE and PFILE?
What is PGA(Program Global Area) ?
What are the pre-requisites to install oracle software ?
What is the Global inventory or central inventory ?
What is Local inventory ?
How to check what are background processes are started for the instance ?
==============system Identifier [sid]=========================
How to create the database ?
database configuration assistance [dbca]======================
What are the shutdown methods ?
What is static and dynamic parameter , How to identify the static or dynamic parameters ?
How to identify the block size of the database ?
===show parameter db_block_size
===select value from v$parameter where name=db_block_size;
Can we create a tablespace with different block size ?
How to identify the total size of the database?
How to check the total size of the tablespace ?
How to check free space of the tablespace ?
How to check the used space of the tablespace ?
What is block/extent/segment ?
What is tablespace ?
What is the size of OS block ?
What are the different types of tablespaces ?
When you create a user default in which tablespace the data is stored ?
 SELECT PROPERTY_VALUE
 FROM DATABASE_PROPERTIES
 WHERE PROPERTY_NAME = 'DEFAULT_PERMANENT_TABLESPACE';
Can we change the default permanent tablespace ?
ALTER DATABASE DEFAULT TABLESPACE DATATBS;
Where do you check the tablespace status and datafile status ?
What is SMALL FILE & BIGFILE tablespace ?
What is the Physical structure of the database ?
How to identify the tablespace type is permenent or undo or temporary ?
How to verify the status of the tablespace ?
What is the use of autoextention on ? where do you get the information of autoextention ?
Can we Limit the autoextention ?
What is the difference between resize and add datafile to the tablespace ?
How to add temporary datafile to temp tablespace ?
Where do you get the information of tempfiles & temp tablespaces ?
How to identify the default temporary tablespace of the database ?
What are the different segments in the undo tablespace?
What is undo retention guaratee and no guarantee ?
Where do you get the information of undo retention ?
What is extent managent ?
What is segment space management ?
Can i drop the tablespace ?
Can i drop the datafile ?
How to drop the schema or user ?
