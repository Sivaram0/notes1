RMAN:
What is RMAN BACKUP and ITS features?
What are the different types of backups ?
What are the different types of backups ?
How to take the rman Hot/cold  backup ?
What is the difference between conventional and RMAN backups ?
What is retention policy in RMAN ?
What is optimization in RMAN?
What is the use of AUTOBACKUP ON controlfile?
What is the use of parallelism in RMAN ?
What is compression in RMAN ?
What set MAXSETSIZE in RMAN ?
What is SNAPSHOT controlfile ? 
what is the difference between obsolete,expired,validate?
`Expaired: A backup or image copy is expired when RMAN cannot find it at its expected location (it may have been manually deleted or lost).`
`CROSSCHECK BACKUP;LIST EXPIRED BACKUP;DELETE EXPIRED BACKUP;`
`Validate: The validate operation checks the integrity of the specified backup files or database files without actually performing a restore.`
`BACKUP VALIDATE DATABASE;RESTORE DATABASE VALIDATE;`
What is the use of crosscheck and obsolete command?
How to check RMAN backup status ?
`V$RMAN_BACKUP_JOB_DETAILS`
What is the difference between incremental Level 0 and full backup ?
What is the backup strategy ?
What is the difference between incremental differential level 1, incremental cumulative level 1?
What is the use of incremental backups?
What is the use of Block change tracking ? What is the background process will be created ?
What are backup commands ?
Difference between catalog and nocatalog?
Difference between using the recovery catalog and the control file in Oracle?
Can we use the same target database as catalog?
Which is one is good, differential (incremental) backup or cumulative (incremental) backup?
Can we perform level 1 backup without level 0 backup?
What is the difference between a backup set and a backup piece?
Suppose you lost one datafile and DB is running in ARCHIVELOG mode. You have full database backup of 1 week/day old and don’t have a backup of the (newly created) datafile. How do you restore/recover file?
What is an obsolete backup and expired backup?
What is the difference between a hot backup and RMAN backup?
What is the use of nofilenamecheck in RMAN ?
Do we need to shutdown the database to change the block change tracking file?
How will you identify a Physical Corruption/Logical corruption? What happens if you lose SPFILE and PFILE and DB crashed with some error, how will you start the database?
What are the database file's that RMAN cannot backup ?
Can we have archive logs and datafile backup in a single backupset ?


-------------------------------------------------------------------------------------
DATA_PUMP:
What is the differnce between traditional export/import and datapump  ?
What is the differnce between traditional export/import and datapump  ?
What is the use of table_exists_action ?
What is the use of parallalism in datapump ?
What are processes will involve in the datapump  ?
What is the view to check datapump status ?
What dba_datapump_jobs contains ?
How to improve exp performance?
How to improve imp performance?
What is the use of INDEXFILE option in imp?
What is the use of IGNORE option in imp?
What are the differences between expdp and exp (Data Pump or normal exp/imp)?
Why expdp is faster than exp (or) why Data Pump is faster than conventional export/import?
How to improve expdp performance?
How to improve impdp performance?
In Data Pump, where the jobs info will be stored (or) if you restart a job in Data Pump, how it will know from where to resume?
What is the order of importing objects in impdp?
How to import only metadata?
How to import into different user/tablespace/datafile/table?
How to export/import without using an external directory?
Using Data Pump, how to export in higher version (11g) and import into lower version (10g), can we import to 9i?
Using normal exp/imp, how to export in higher version (11g) and import into lower version (10g/9i)?
How to do transport tablespaces (and across platforms) using exp/imp or expdp/impdp?



12
13 RMAN BACKUP
14 CLONING
15 DataPump
16 
17 DataPump
18 
19 DG
20 
21 restore recover
22 
23 PATCH
24 MULTI
25 PERFORMANCE_TUNING

DataGuard, Restore & Recoveries, Patching, Tuning


alter database add standby logfile
  2  group 8 '/u01/bsprod/oradata/bsprod/stby08.log' size 50m,
  3  group 9 '/u01/bsprod/oradata/bsprod/stby09.log' size 50m,
  4  group 10 '/u01/bsprod/oradata/bsprod/stby10.log' size 50m,
  5  group 11 '/u01/bsprod/oradata/bsprod/stby11.log' size 50m,
  6  group 12 '/u01/bsprod/oradata/bsprod/stby12.log' size 50m;