--------------------

ARCH of DATABASE memoryarch,process arch,storage arch
  memory arch [it speaks about sga]
  process arch [it speaks about background process]
  storage arch [it speaks about dbfile,controlfile,redologfile,archivelogfile]

Database: collection of C+R+D

ORACLE INSTANCE = Combination of memory process[ sga ]  + Background processes   
  Memory process: sga [shared pool(library cache,data dictonary cache), database buffer cache, redolog buffercache]
  Background process: process monitor,systm monitor, database writer, log writer, checkpoint

ORACLE DATABASE SERVER : is combination of Instance + Database

DATABASE STARTUP STATES:
 NOMOUNT: In this state with the help parameterfile instance started , But Database not yet mounted.
 MOUNT: In this state Instance mounts the Database by reading controlfile.
 OPEN: In this state Database is fully operational and availble for operatons, it opens datafiles and redologfiles.
 RESTRICTED: Inthis state Database opend but accessible only to users with restricted session priviliges.        

startup nomount
alter databse mount
alter database open
alter database close
shutdown

Parameterfile: is a crusical file for the initialzing the instance , it had configuration and managemnet setup for Database instance
               it had two files 1.server parameterfile[spfile] 2.Parameter file
Controlfile:   is a crucial component of an Oracle database. It is a small binary file that records the physical structure of the Database         and contains essential metadata. The control file is necessary for the database to operate, and without it, the database cannot be started.            
-------------------------------

SQL- Structural querry language
SQL> sqlplus / as sysdba
SQL> select status from V$instance;
SQL> strings -a spfile db.ora "Databasename"
 
We always set oracle environamental variable
. oraenv
ORACLE_SID = [ oracle ] ? bsprod


SQL>select status from V$instance;
SQL>select name from V$datafile;
SQL>select member from V$logfile;
SQL>select status from V$instance;

$] tail -f   alert_bsprod.log

sQL>select startup_time from V$instance;

ALERTLOG FILE: alertlog file is a tracefile that contains a chronological log of text and errors reportd by the oracle database. It is used to check database health, diagnose issues and trac database activities.
contents of alertfile: startup,shutdown info,database errors,checkpoint information, Administrative operations, Deadlock information,logswitchs,Resource issues,Tablespaces, Autometic Diagonistic Repository.
location of alertfile is ADR

TABLESPACE: Tablespaces in oracle database are crucical for organising and managing database storage. Tablespace is a logical storage unit that    contains and organises database objects such as tables and indexes, Tablespaces simplify the management of data by allowing you to group related objects together, There by making it easier to allocate storage space and manage disk resources.

Datafile > Segments> Extent> Block

Common Types of Tablespace: system tablespace,sysauxtablespace,usertablespace,temptablespace,undotailspace

SQL>select name from V$tablespace;
SQL>select name from V$datafile;

we always check space availbility in database

$] !df -h /u01/bsprod/oradata/bsprod

CREATE TABLESPACE
SQL> create tablespace xyzdata datafile '/u01/bsprod/oradata/bsprod/xyzdata01.dbf' size 10m autoextend on;

CHECK TABLESPACE
SQL>desc dba_data-file;

Check
SQL>select FILE_NAME,AUTOEXTENSIBLE,MAXBYTES/1024/1024/1024 from dba_data_files;
SQL>col FILE_NAME for a50
SQL>/

Create datafile unlimetd size in different tablespace
SQL>create tablespace xyz1data datafile '/u01/bsprod/oradata/bsprod/xyz01.dbf' size 10m autoextend on next 10m maxsize unlimited;

Add datafile to existing tablespace without AUTO EXTENSIBLE
SQL>alter tablespace xyz1data add datafile 'u01/bsprod/oradata/bsprod/newdile.dbf' size 10m;

Change the existening file to auto extansible
SQL> alter xyz1data datafile 'u01/bsprod/oradata/bsprod/newdile.dbf' autoextend on;
