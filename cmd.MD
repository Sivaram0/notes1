. oraenv  select enveronment 
./etc/oratab set database home
./u01/app/oracle/diag/rdbsm/<database>/trace alert_database.log
select status from v$instance;
select startup_time from v$instnace;
select name from v$tablespace;
select name from v$datafile;
select member from v$logfile;
create tablespace abc datafile '/uo1/bsprod/oradata/bsprod/abc01.dbf' size 10m auto extend on;
alter tablespace abc add datafile '/u01/bsprod/oradata/bsprod/abc02.dbf' size 5m auto extend on next 2m max size 50m;
desc dba_data_file;
select tablespace_name,status from dba_tablespaces;