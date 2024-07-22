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
earth identified by welcome;
venus identified by welcome;
pluto identified by welcome;



Create ID:
CREATE TABLE ems ( employee_id NUMBER(5) PRIMARY KEY, first_name VARCHAR2(50),last_name VARCHAR2(50),email VARCHAR2(100) UNIQUE,hire_date  DATE,salary NUMBER(10, 2),department_id NUMBER(4));


INSERT INTO employees (employee_id, first_name, last_name, email, hire_date, salary, department_id) VALUES (2, 'siva', 'Dorr', 'siva.doe@example.com', TO_DATE('2424-07-18', 'YYYY-MM-DD'), 70000.00, 200);



# show all ussers privileges :
SELECT grantee, privilege FROM DBA_SYS_PRIVS;
# for individual user privilises:
SELECT privilege FROM DBA_SYS_PRIVS WHERE grantee = 'VENUS';
# grant all privilises to role :
GRANT ALL PRIVILEGES TO common_role;

etc/sysconfig/network-scripts


uuid = 0282036d-17d5-4156-99ac-f48bcb84c437