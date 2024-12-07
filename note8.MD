what is privilise ?
create user && show user ?
grant privilige to user ?
Identify which privs are availble in sys level ?
show which privs are assigned to user ?
----------------------------
What is role ?
create role && asign it to user ?
grant privs to the role ?
Identify which privs are availble in sys level, based on role how to select privs to role ?
show which privs are assigned to role ?
----------------------------
what is profile ?
what are the features availble in profiles ?
create profile and grant to the user ?
show what are the limits , identify what is what ?
Identify which privs are availble to profle ?
--------------------------------
What is Quota?
what are the features and what is the purpose?
create quota and grant to user?
show what are the quotas are availble to grant?
Identify which quotas are availble for user?


===============================



Create ID:
CREATE TABLE ems ( employee_id NUMBER(5) PRIMARY KEY, first_name VARCHAR2(50),last_name VARCHAR2(50),email VARCHAR2(100) UNIQUE,hire_date  DATE,roll NUMBER NUMBER(10, 2),department_id NUMBER(4));


INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, roll NUMBER, department_id) VALUES (2, 'siva', 'Dorr', 'siva.doe@example.com', TO_DATE('2424-07-18', 'YYYY-MM-DD'), 70000.00, 200);



# show all ussers privileges :
SELECT grantee, privilege FROM DBA_SYS_PRIVS;
# for individual user privilises:
SELECT privilege FROM DBA_SYS_PRIVS WHERE grantee = 'VENUS';
# grant all privilises to role :
GRANT ALL PRIVILEGES TO common_role;

etc/sysconfig/network-scripts


uuid = 0282036d-17d5-4156-99ac-f48bcb84c437

clone ::
auxiliary dulpicate  clone, active duplicate clone

AUXILIARY DUPLICATE CLONE::
create pfile from target to auxiliary
update parameter on pfile to auxiliary
take rman backup
copy backup piece to the auxiliary
connect to rman 
duplicate database to bstest backup location'/u01/bsprod/rman';

Active duplicate clone::
create pfile from target to auxiliary
update parameters on pfile
copy password file
set listners and tns entries
connect rman target=sys/welcome@bsprod auxiliary=sys/welcome@bsprod_dr
duplicate target database to bstest from active database nofilename check;


Tablespaces, User_management, Listner setup

Upgrade, 19c_installation, Multi_tenent

Clone, Datapump

DataGuard, 

Patching, Restore & recoveries

Performance Tuning



CREATE TABLE students (
    student_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    roll NUMBER(10, 2),
    hire_date DATE
) TABLESPACE BMW;

INSERT INTO students (student_id, first_name, last_name, roll, hire_date)
VALUES (1, 'Alice', 'Johnson', 50000, TO_DATE('2024-01-01', 'YYYY-MM-DD'));

INSERT INTO students (student_id, first_name, last_name, roll, hire_date)
VALUES (2, 'Bob', 'Smith', 60000, TO_DATE('2024-02-15', 'YYYY-MM-DD'));

INSERT INTO students (student_id, first_name, last_name, roll, hire_date)
VALUES (3, 'Charlie', 'Brown', 70000, TO_DATE('2024-03-20', 'YYYY-MM-DD'));


SELECT segment_name, segment_type, bytes / 1024 / 1024 AS size_mb
FROM user_segments
WHERE segment_name = 'STUDENTS'; 



Standby DataGuard:

copy pfile and change parameter
password file also 
setup listners
setup TNS entries
connect to rman
rman target=sys/welcome@bsprod auxiliary=sys/welcome@bstest 
run cmd > duplicate target database for standby from active database nofilename check;
 add redo log file to auxiliary database as part of build dataguard n+1 stratgy
recover managed standby database using current logfile disconnect;
recover managed standby database using current logfile cancel;
MRP OF/ON 
show parameter standby 
alter system set standby_file_management AUTO;
alter system set log_archive_dest_state_2=defer;
alter system set log_archive_dest_state_2=enable;
alter database commit to switchover to standby;
----------------------------------------------
alter database add standby logfile
group 4 '/u01/bsprod/jsdifs/sdfsdf/dsd/alter 
alter system set log_archive_dest_2='SERVICE=BSPROD LGWR='sync';
alter database set standby database to maximize availbility;

shut immediate;
startup mount;
select protection_mode from v$database;
recover managed standby database current logfile disconnect;
recover managed standby atabase current logfile cancel;

========================================
Hello all I am sivarama, i had total 3+ years of experience in oracle database adminstration, In my experience i worked for two domains like 
telecomunications and bankings , In which i have handled users creation, password setups, create roles , Assign roles to users as a part of user User_management
on the  other hand managed tabelespace management like add datafile to tablespace, extend size of datafile similar to that, And had done cloning database for testing
and development purpose , I have done dester recovery and patching, backups like RMAN,expdp,impdp, Database creation using dbua , database upgradation with dbua.

===============