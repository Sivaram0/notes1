Structurd Querry language:

# for oracle database instance  querry details : 
  desc v$instance;
   # if you want all instance details 
     select * from v$instance; (or) needed any thing special replace * with required fields
# for oracle parameterfile querry details:
  desc v$parameter;
  select * from v$parameter; (or) needed anythhing special replace * with required fields
# for oracle alertfile location:
  desc v$diag_info; 
  - Identify the address and check it in linux os , fire cmd [ tail -f alert_bsprod.log (it will show the realtime enevetns in database)]
  - autometic diagnostic repository
# for checking tablespaces querry details;
  desc v$tablespace;
  select * from v$tablespace;
# In general if we want to create datafile first we need to check the space availbility for that :
  !df -h /u01/bsprod/oradata/bsprod => it shows the complete details of the space in database.
# Need to know the datafile wheter it exicxutes or not 
  desc v$datafile;
  select {values}  from v$datafile;
# Status of the database files with size ,autoextend etc:
  desc dba_data_files;
  select * from dba_data_file; or else if you need specific replace * with the something // careful in this cmd
# check particular datafiles size with tablespace:
  select file_name,bytes/1024/1024/1024 from dba_data_files where tablespace_name='franklin_tablespace';
# show parameter undo, temp etc:
  show parameter undo;
  show parameter temp;
  show parameter db_block_size;
-------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------

# create  tablespace along with datafiles examples:
  # create tablespace along with datafile:
  - create tablespace franklin_tablespace datafile /u01/bsprod/oradata/bsprod/frank.dbf' size 10m autoextend on;
  # add datafile to existing tablespace:
  - alter tablespace franklin_tablespace add datafile '/u01/bsprod/oradata/bsprod/frank01.dbf' size 15m;    
  # create tablespace and datafile @ autoextend on with size unlimited;
  - create tablespace isro_tablespace datafile '/u01/bsprod/oradata/bsprod/aryabhat1.dbf' size 10m autoextend on next 5m maxsize unlimited;
  # change existing_file to autoextensibe
  - alter database datafile '/u01/bsprod/oradata/bsprod/frank01.dbf' autoextned on;
  # create multiple dbf inside a tablespace at a time:
  - create tablespace ruscomos_tablespace datafile '/u01/bsprod/oradata/bsprod/cosmodrom.dbf' size 5m, '/u01/bsprod/oradata/bsprod/cosmodrom1.dbf' size 10m;
  # create bigtablespace:
  - create bigfile tablespace nasa_bigspace datafile '/u01/bsprod/oradata/bsprod/applolo.dbf' size 25m;  // we can add up to 32TB space >><< smallfiles upto 32gb