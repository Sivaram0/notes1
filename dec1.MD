What is Database ?
What is SGA,PGA,BACKGROUND PROCESSES?
What is Tablespace , types of Tablespaces and purpose of it?
Create tablespace along with datafile basic parameters like size is enough?
Create tablespace with big file ?
Create datafile in temp tablespace?
Check datafile directory space?
Check tablespace size?
check total size availbility ?


will resize the datafile after seeing the alerts in alertlog file for checking?

Flashback_on

======================================================================
. oraenv == bsprod environment variable
cd /etc/oratab/ setup database home location
cd /etc/sysconfig/network-scripts/ifcfg-ens33 setup ip address
mkdir -p /u01/bsprod/oradata/bsprod/ create directory
rm -rf <files> remove files
df -h show disk space
htop/top -  show cpu utilization






sqlplus / as sysdba
startup mount;
startup nomount;
startup;
show parameter pfile / log / 
select status from v$instance;
select name from v$datafile;
select name from v$tablespace;
select name from v$redolog;
show parameter control;
show parameter pfile;
show parameter log;
show parameter undo;
select value from v$diag_info; finding alertlog file
tail -f alert.log
-----------------------------------------------------------------------
select startup_time from v$instance;
select tablespace_name,status from dba_tablespaces;
alter tablespace <tablespace_name> OFFLINE;
alter tablespace <tablespace_name> read only;
select <tablespace_name>,contents from dba_tablespaces;
create tablespace <tablespace_name> datafile '/u01/bsprod/oradata/bsprod/u.dbf' size 1m;
create temporary tablespace tempx tempfile '/u01/bsprod/oradata/bsprod/temp.dbf' size 1m;
create undo tablespace undotbs2 datafile '/u02/bsprod/oradata/bsprod/undotbs.dbf' size 1m;
alter system set undo_tablespace='UNDOTBS2';
select tablespace_name,block_size from dba_table_space;
PHYSICAL DATAFILE USAGE SIZE CHECK ?
------------------------------------------------
NETWORK::
vncserrver
netmgr
lsnrctl start <listner_name>
tnsping <tns_name>
cd $ORACLE_HOME/network/admin
TNS :: transperent network substrate
---------------------------------------------------
PARAMETER_FILE::
location $ORACLE_HOME/dbs -> spfile/pfile
select value from v$parameter where name='spfile';
create pfile from spfile;
desc v$parameter;
select name,isinstance_modifiable from v$parameter where name='shared_pool_size';
---------------------------------------------------
USER_MANAGEMENT::
create user <user_name> identifiled by welcome;
grant create session to 
-------------------------------
create role tester and developer1 assign specific priviliges, do practice;
create user and assign role to that user,
check wether working or not;
-----------------------------------
Backups::
cold 
hot  
Rman
alter system set log_arch_='LOCATION=/u01/bsprod/arch/' scope=spfile;

==================
restart Devops