. oraenv <ORACLE_SID> ==>> setup environment variable
startup nomount/mount/normal >> start instance stages
shutdown normal/immediate/abort >> shutdown instance stages
select value from v$diag_info; >> for different file locations
alertfile location >> cd /u01/app/oracle/diag/rdbms/bsprod/bsprod/trace
tail -f alert.log
select status from v$instance; status of instance
select name from v$database;  name of currently running database
select name from v$tablespace; all tablespaces
select name from v$datafile; all datafiles
select member from v$logfile; all logfiles
create tablespace <tablespace_name> datafile '/u01/bsprod/oradata/bsprod/sso.dbf' size 2m;
alter tablespace <tablespace_name> add datafile '/u01/bsprod/oradata/bsprod/ss1.dbf' size 2m;
alter database datafile '/u01/bsprod/oradata/bsprod/sso.dbf' size 2m autoextend on next 2m maxsize 10m;
alter database datafile '/u01/bsprod/oradata/bsprod/ss1.dbf' size 2m autoextend off;
alter database datafile '/u01/bsprod/oradata/bsprod/ss1.dbf' resize 5m;
alter database datafile '/u01/bsprod/oradata/bsprod/ss1.dbf' offline;
alter tablespace <tablespace_name> offline >> read only
alter tablespace <ablespace_name> online >> read write
  
VIEWS::
desc v$tablespace;
select * from v$tablespace;
select * from dba_tablespaces;
select * from dba_data_files;

--- To VIEW TABLESPACES ---

SET LINESIZE 150
SET PAGESIZE 50
COLUMN TABLESPACE_NAME FORMAT A20
COLUMN BLOCK_SIZE FORMAT 99999
COLUMN INITIAL_EXTENT FORMAT A12
COLUMN NEXT_EXTENT FORMAT A12
COLUMN MAX_EXTENTS FORMAT 999999
COLUMN MAX_SIZE FORMAT 999999
COLUMN PCT_INCREASE FORMAT A12
COLUMN MIN_EXTLEN FORMAT 99999
COLUMN STATUS FORMAT A10
COLUMN CONTENTS FORMAT A10
COLUMN LOGGING FORMAT A10
COLUMN EXTENT_MANAGEMENT FORMAT A10
COLUMN ALLOCATION_TYPE FORMAT A10
COLUMN SEGMENT_SPACE_MANAGEMENT FORMAT A10
COLUMN BIGFILE FORMAT A5

SELECT 
    TABLESPACE_NAME, BLOCK_SIZE, INITIAL_EXTENT, NEXT_EXTENT, MIN_EXTENTS, MAX_EXTENTS, MAX_SIZE, PCT_INCREASE, MIN_EXTLEN, STATUS, CONTENTS,
    LOGGING, EXTENT_MANAGEMENT AS EXTENT_MAN, ALLOCATION_TYPE AS ALLOC_TYPE, SEGMENT_SPACE_MANAGEMENT AS SEGMENT_MGMT, BIGFILE
FROM DBA_TABLESPACES;

select tablespace_name,status from dba_tablespaces; >> TO CHECK TABLESPACE DETAILS
select * from dba_data_files;  >> TO CHECK DATAFILE DETAILS
select FILE_NAME,BYTES/1024/1024 from dba_data_files where TABLESPACE_NAME='<TABLESPACE_NAME>'; to know the size of tablespace
select tablespace_name,contents from dba_tablespaces; >> CHECKING THE TABLESPACE PERMEMENT OR TEMPORARY
SELECT TABLESPACE_NAME from dba_tablespaces order by tablespace_name;
select contents, count(*) from dba_tablespace order by tablespace_name;
show parameter UNDO;
alter system set undo_tablespace ='UNDOTBS2'; >> SET DEFAULT UNDO TABLESPACE
select tablespace_name,block_size from dba_tablespaces;
show parameter db_block_size;
ALTER DATABASE TEMPFILE '/u01/oracle/data/lmtemp02.dbf' DROP INCLUDING DATAFILES;

====================================================================================================================

NETWORKING ::

lsnrctl start <ORACLE_SID>
lsnrctl status 
lsnrctl stop <ORACLE_SID>

tnsping <ORACLE_SID>
network location : cd $ORACLE_HOME/network/admin
vncserver >> FOR GRAPHICAL USER INTERFACE WE NEED TO CONNECT VNC SERVER
netmgr >> FOR CONNECTING LISTNER SETUP
TRANSPERENT NETWORK SUBSTRATE

=========================================================================================

PARAMETER FILE MANAGEMENT ::

cd $ORACLE_HOME/dbs >>  LOCATION FOR spfile/pfile/orapwd
desc v$parameter;
select name, isinstance_modifiable from v$parameter where name='shared_pool_size';
ISINSTANCE_MODIFIABLE = TRUE dynamic parameter
ISINSTANCE_MODIFABLE = FALSE static parameter 
SCOPE = memory, spfile, both

startup pfile='<location of pfile>' IF WE WANT TO START PFILE WHICH WAS IN DIFFERENT LOCATION

======================================================================================

USER_MANAGEMENT ::
 Priviliges, Roles, Quotas, Profiles

USER:
create user <user_name> identified by <password>; 
drop user <user_name> cascade;
alter user <user_name> account unlock;
alter user <user_name> account lock;
select user_name, account_status from dba_users where username = '<user_name>';
alter user <user_name> identified by <password>;
alter user <user_name> profile default;
alter user <user_name> identified by <password>;
alter user <user_name> profile <profile_name>;
grant sysdba to <user_name>;
revoke sysdba from <user_name>;

PRIVILEGE:
desc dba_sys_privs; >> show different types of Priviliges
select Priviliges from dba_sys_privs;
grant connect,create session to <user>; 
grant create table to <user>;
conn <user_name> / <password>
show user; >> check current user
select GRANTEE, PRIVILEGE from DBA_SYS_PRIVS; where GRANTEE='<USER_NAME>';  >> to check the granted Priviliges of the user
revoke create session from <user_name>;
revoke create table from <user_name>;

ROLES:
create role <ROLE_NAME>;
desc dba_roles;
select role from dba_roles;
grant connect,create session, create table, [so on required privs] to <ROLE_NAME>;
grant <ROLE_NAME> to <USER_NAME>;
drop role <ROLE_NAME>;

PROFILES:
desc dba_profiles;
select RESORCE_NAME, LIMIT from dba_profiles;
create profile <profile_name> limits  FAILED LOGIN_ATTEMPTS 3, PASSWORD REUSE MAX 3;
alter user <user_name> profile <profile_name>;

QUOTAS:
create tablespace <tablespace_name> datafile '/u01/bsprod/oradata/bsprod/abc.dbf' size 2m;
alter user <user_name> quota 2m on <datafile>;
desc dba_ts_quotas;
select table_sapace_name,username,max bytes/1024/1024 from dba_ts_quotas where tablespace_name='<tablespace_name>';
alter user <user_name> quota 4m on <tablespace>;

====================================
==========================================


Find location of datafile,controlfile,redologfile
find aletrelogfile
see instnace status
see database name
see total tablespace
see tablespaces and autoextension status
see static parameter, dynammic parametr status;