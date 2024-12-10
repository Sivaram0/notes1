COLD_BACKUPS ::
mkdir -p /u01/bsprod/cold_backup
take datafile,redo log file, cotrolfile locations and copy the files and  paste all the files in this folder

HOT_BACKUPS ::
alter system set log_archive_dest_1='LOCATION=/u01/bsprod/arch/';
show parameter log_archive_dest_1
show parameter log_archive_format
alter systm set log_archive_format='arch_%t_%s_%r.log' scope=spfile;

archive log list;
alter database archivelog;
alter database noarchivelog;
alter system switch logfile;


RMAN COLD_BACKUP ::

database shoud be mount/shutdown state 
rman target /
configure channel device type disk format '/u01/bsprod/rman/cold/%d_%s.rman';
backup database;
show all;

RMAN HOT_BACKUP ::

show all;
alter database open;
rman targt /
configure channel device type disk format '/u01/bsprod/rman/hot/%d_%s.rman';
backup database current controlfile plus archivelog;
configure retention policy to redundancy 2;
configure rentention policy to recover window of 7 dayas;
show retention policy;
report obsolete;
delete obsolete;
list backup;
list backup summary;
delete expired backup;
configure device type disk parallism 2;
backup incremental level 0 database current controlfile plus archivelog;
backup incremental level 1 database current controlfile plus archivelog;
backup incremental level 1 cummulative database current controlfile plus archive;

>alter database enable blockchange tracking using file '/u01/bsprod/rman/bctfile';
>select * from v$block_change_tracking; 
cofigure controlfile autobackup on;
configure optimization on;
crosscheck backup;
report schema;
validatae backup;
delete expired archivelog all;
crosscheck archvelog all;
list backup of archivelog all;
CONFIGURE DATAFILE BACKUP COPIES FOR DEVICE TYPE DISK TO 1;
CONFIGURE ARCHIVELOG DELETION POLICY TO NONE; 
CONFIGURE DEVICE TYPE DISK PARALLELISM 1 BACKUP TYPE TO BACKUPSET;

DATA_PUMP: 

mkdir -p /u01/bsprod/export
create directory export24 as '/u01/bsprod/export/';
create new user give privileges to create table and insert data to that
create user <username> identified by welcome;
grant connect, create table to user <username>;
create table dept(number);
insert data dept (100);
commit;
expdp dumpfile=dept.dmp sqlplus / as sysdba directory=expdp24 tables=<username>.dept;
expdp dumpfile=emp.dmp sqlplus / as sysdba directory=expdp24 schemas=<username>;
expdp dumpfile=tablespaces.dmp directory=expdp24 tablespaces=<tablespaces_name>
mkdir -p /u01/bstest/impdp/
create directory impdp24 as '/u01/bstest/import/';
copy expdp dumpfiles to expdp folder scp * 192.168.1.98:/u01/bstest/import/.
impdp dumpfile=dept.dmp sqlplus / as sysdba directory=impdp24 
expdp dumpfile=full_%u.dmp directory=expdp_24 full=y parallel=4 
restore A table remap_table= <existing_name>:<new_name>
impdp dumpfile=abc_schema.dmp directory=impdp24 remap_table=<existing_name>:<new_name>
                                                remap_tablespace=<existing_name>:<new_name>
                                                remap_schema=<existing_name>:<new_name>
table_exists_action=append,truncate,replace,skip
estimate_only=y
content=metadata_only
content=data_only
expdp help=y
compression=all
include
logfile
network_link
parfile
querry
take backup from 11g to 19c
expdp dumpfile=emp.dmp directory=expdp24 tables=<username>:<table> version=11
flashback_scn
flashback_time

