ORACLE DATABASE BASICS:
1. What is database?
`database is a oraganised collection of data , It is stored electronically and can be accessed, managed and updated efficiently. database are designed to store large amounts of information and can be accesses easily as we needed , In which we had relational databases, nosql databases,cloud databases so others`
2. What is SGA?
`SGA stands for system global area, It is a shared memory area used by the database instance to store data and control information. It is a key component of oracle's archicture and is shared by all processes connectd to the database; in which components like database buffer cache, redo log buffer cache, shared pool[data dictonary cache,]`
3. What is PGA?
`PGA for process global area, It is a memory region dedicated to a single oracle database process.`
4. What is instance?
`instance is a combination of memory structure and back ground processes thats works together to intrect database , Components of oracle instance: Memory structures, Background processes`
5. What are background processes?
`Oracle instance includes several background processses to handle specific tasks. DWWn,LGWR,SMON,PMON,CKPT,ARCn`
6. what is tablespace?

7. What is oracle database server?
8. What happens when you kill the manditory background processes ?
9. How to check how many databases are up and running on the server?
10. How to check the version and bit version of oracle software?
11. How to check how many databases are configured on the server?
12. How to start the database if pfile is not in default location?
13. What is the difference between ORACLE_BASE and ORACLE_HOME?s
14. What is the use of oratab file?
15. How do you check if oracle software installed on a server?
16. What is  Oracle database's physical and logical structure ?
17. What is the use of Control files ?
18. What is the difference between SPFILE and PFILE?
19. What is PGA(Program Global Area) ?
20. What are the pre-requisites to install oracle software ?
21. What is the Global inventory or central inventory ? What is Local inventory ?
22. How to check what are background processes are started for the instance ?
23. How to create the database ?
24. What are the startup stages ?
25. What are the shutdown methods ?
26. What is static and dynamic parameter , How to identify the static or dynamic parameters ? 
27. What is the default block size of oracle database ?
28. Can we create a tablespace with different block size ?
29. How to identify the total size of the database?
30. How to check the total size of the tablespace ?
31. How to check free space of the tablespace ?
32. How to check the used space of the tablespace ?
33. What is block ?, What is extent ?, What is segment ?
34. What is tablespace ?
35. What is the size of OS block ?
36. One oracle Block is equal to howmany OS blocks ?
37. What are the different types of tablespaces ?
38. When you create a user default in which tablespace the data is stored ?
39. How to identify the default permanent tablespace of the database ?
40. Can we change the default permanent tablespace ?
41. How to make the tablespace offline/online/read only ? What happens when you put offline?
42. How to make the datafile offline ?
43. Where do you check the tablespace status and datafile status 
44. What is SMALL FILE & BIGFILE tablespace ?
45. What is the Physical structure of the database ?

46. How to identify the tablespace type is permenent or undo or temporary ?
47. How to verify the status of the tablespace ?
    `select tablespace_name,status from v$dba_tablespace; `
48. What is the use of autoextention on ? where do you get the information of autoextention ?
    ` `
49. Can we Limit the autoextention ?
   `yes, alter database datafile '/u01/bsprod/oradata/bsprod/new.dbf' autoextend off;`
50. What is the difference between resize and add datafile to the tablespace ?
  `we can resize the datafile of already existing one like by using "alter database  datafile '/u01/bsprod/oradata/bsprod/new.dbf' size 6m;`
  `adding datafile  alter tablespace TBNAME add datafile '/u01/bsprod/oradata/bsprod/new01.dbf' size 2m;`
++++++++++++++++++++++++++++++++++++++++++++

1. I had 1.5 tb database to take backup and it will completed this task around 5 hours roughly , so is there any chance to decrease the backup time ?
2. Oracle dba archicture ?
3. checkpoint LGWR ?
4. database snapshot vs backup ?
5. on premiss database, nobody had sysadmin permissions to take backup,client want to do take backup, you don't have permissions to take backup ? then what you do ?
   forcelfully reset the password, enter the server
     
     TWO DAYS::

Dataguard, Restores && Recoveries
===============================

Tablespace management  OK
User management        OK
Backup RMAN/HOT/COLD   OK          
19c install/upgrade    OK
Multi_tenent           OK
Cloning                OK
Datapump
Dataguard
Patching               --
Restore & Recovories   --

Restore datafile, Restore total datafiles, Restore controlfile, Restore redologfile,