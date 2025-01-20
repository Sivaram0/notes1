1. SGA is system global area it consists of database buffer cache, redolog buffer cache, shared pool [ library cache, Data dictonary cache],
2. Instance is consists of system global area and background processes,
3. Database had multiple files like controlfile,datafile,redologfiles
   controlfile speaks about information of database 
   redologfile contains redo entires information means like series of operation what have done
   datafile is a physcial file it contains actual trascitional data
4. Database server is combination of instance and database
5. background processes are pmon,smon,checkpoint,dbwrlgwr,
6. when you kill the background process with the help of ps -ef | grep ora_ & kill -9 pid it will crash instance , user disconnect, connection inactive, database restart will happens
7. we can check in oratab, using linux command ps -ef | grep pmon |grep -v grep , using sql queey select instnace_name,status from v$instnace; , Using Oracle Enterprise manager we can see running databases.
8. select * from v$version;
9. check in /etc/oratab , opatch lsinventory, check listner file, show parameter db_name;
10. using STARTUP PFILE='/u01/bsprod/oradata/bsprod_1/pfile.ora';

----------------------------------------------------------

11. oracle_base is location for oracle software and other hand oracle_home is location for database '
12. oratab file is for setting up database home location
13. select * from v$version;
14. 