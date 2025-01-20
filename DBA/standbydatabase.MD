ORACLE_SID = [bsprod_dr] ? bsprod
The Oracle base has been set to /u01/app/oracle
[oracle@srvr88 ~]$
[oracle@srvr88 ~]$
[oracle@srvr88 ~]$ clear
[oracle@srvr88 ~]$ sqlplus / as sysdba;

SQL*Plus: Release 19.0.0.0.0 - Production on Sat Sep 21 10:39:25 2024
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle.  All rights reserved.

sConnected to an idle instance.

SQL>startup
ORACLE instance started.

Total System Global Area 1002437904 bytes
Fixed Size                  8903952 bytes
Variable Size             318767104 bytes
Database Buffers          671088640 bytes
Redo Buffers                3678208 bytes
Database mounted.
ORA-01122: database file 1 failed verification check
ORA-01110: data file 1: '/u01/bsprod/oradata/bsprod/system01.dbf'
ORA-01206: file is not part of this database - wrong database id


SQL> exit
Disconnected from Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0
[oracle@srvr88 ~]$ cat /etc/oratab
#



# This file is used by ORACLE utilities.  It is created by root.sh
# and updated by either Database Configuration Assistant while creating
# a database or ASM Configuration Assistant while creating ASM instance.

# A colon, ':', is used as the field terminator.  A new line terminates
# the entry.  Lines beginning with a pound sign, '#', are comments.
#
# Entries are of the form:
#   $ORACLE_SID:$ORACLE_HOME:<N|Y>:
#
# The first and second fields are the system identifier and home
# directory of the database respectively.  The third filed indicates
# to the dbstart utility that the database should , "Y", or should not,
# "N", be brought up at system boot time.
#
# Multiple entries with the same $ORACLE_SID are not allowed.
#
#
bsprod:/u01/app/oracle/product/19.3.0/db_home:N
orcl:/u01/app/oracle/product/19.3.0/db_home:N
[oracle@srvr88 ~]$ sqlplus / as sysdba;

SQL*Plus: Release 19.0.0.0.0 - Production on Sat Sep 21 10:41:05 2024
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle.  All rights reserved.


Connected to:
Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0

SQL> shut abort
ORACLE instance shut down.
SQL> startup
ORACLE instance started.

Total System Global Area 1002437904 bytes
Fixed Size                  8903952 bytes
Variable Size             318767104 bytes
Database Buffers          671088640 bytes
Redo Buffers                3678208 bytes
Database mounted.
ORA-01122: database file 1 failed verification check
ORA-01110: data file 1: '/u01/bsprod/oradata/bsprod/system01.dbf'
ORA-01206: file is not part of this database - wrong database id


SQL> select name from v$datafile;

NAME
--------------------------------------------------------------------------------
/u01/bsprod/oradata/bsprod/system01.dbf
/u01/bsprod/oradata/bsprod/sysaux01.dbf
/u01/bsprod/oradata/bsprod/undotbs01.dbf
/u01/bsprod/oradata/bsprod/users01.dbf
/u01/bsprod/oradata/bsprod/defdata01.dbf
/u01/bsprod/oradata/bsprod/dudue01.dbf
/u01/bsprod/oradata/bsprod/dudue02.dbf
/u01/bsprod/oradata/bsprod/corn01.dbf
/u01/bsprod/oradata/bsprod/corn03.dbf
/u01/bsprod/oradata/bsprod/lens001.dbf

10 rows selected.

SQL> ^C

SQL>
SQL>
SQL> exit
Disconnected from Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0
[oracle@srvr88 ~]$
[oracle@srvr88 ~]$
[oracle@srvr88 ~]$ rman target/

Recovery Manager: Release 19.0.0.0.0 - Production on Sat Sep 21 10:46:39 2024
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle and/or its affiliates.  All rights reserved.

connected to target database: BSPROD (DBID=3457701842, not open)

RMAN> report schema
2> ;

using target database control file instead of recovery catalog
Report of database schema for database with db_unique_name BSPROD

List of Permanent Datafiles
===========================
File Size(MB) Tablespace           RB segs Datafile Name
---- -------- -------------------- ------- ------------------------
1    1050     SYSTEM               ***     /u01/bsprod/oradata/bsprod/system01.dbf
2    640      SYSAUX               ***     /u01/bsprod/oradata/bsprod/sysaux01.dbf
3    915      UNDOTBS1             ***     /u01/bsprod/oradata/bsprod/undotbs01.dbf
4    5        USERS                ***     /u01/bsprod/oradata/bsprod/users01.dbf
5    10       ROME                 ***     /u01/bsprod/oradata/bsprod/defdata01.dbf
6    10       DUKE                 ***     /u01/bsprod/oradata/bsprod/dudue01.dbf
7    5        DUKE                 ***     /u01/bsprod/oradata/bsprod/dudue02.dbf
8    5        CORN                 ***     /u01/bsprod/oradata/bsprod/corn01.dbf
9    2        CORN                 ***     /u01/bsprod/oradata/bsprod/corn03.dbf
10   3        LENS                 ***     /u01/bsprod/oradata/bsprod/lens001.dbf

List of Temporary Files
=======================
File Size(MB) Tablespace           Maxsize(MB) Tempfile Name
---- -------- -------------------- ----------- --------------------
1    20       TEMP                 32767       /u01/bsprod/oradata/bsprod/temp01.dbf
2    100      TEMP                 32767       /u01/bsprod/oradata/bsprod/temp03.dbf

RMAN> restore database datafile 1;

Starting restore at 21-SEP-24
allocated channel: ORA_DISK_1
channel ORA_DISK_1: SID=427 device type=DISK

channel ORA_DISK_1: starting datafile backup set restore
channel ORA_DISK_1: specifying datafile(s) to restore from backup set
channel ORA_DISK_1: restoring datafile 00001 to /u01/bsprod/oradata/bsprod/system01.dbf
channel ORA_DISK_1: restoring datafile 00002 to /u01/bsprod/oradata/bsprod/sysaux01.dbf
channel ORA_DISK_1: restoring datafile 00003 to /u01/bsprod/oradata/bsprod/undotbs01.dbf
channel ORA_DISK_1: restoring datafile 00004 to /u01/bsprod/oradata/bsprod/users01.dbf
channel ORA_DISK_1: restoring datafile 00005 to /u01/bsprod/oradata/bsprod/defdata01.dbf
channel ORA_DISK_1: restoring datafile 00006 to /u01/bsprod/oradata/bsprod/dudue01.dbf
channel ORA_DISK_1: restoring datafile 00007 to /u01/bsprod/oradata/bsprod/dudue02.dbf
channel ORA_DISK_1: restoring datafile 00008 to /u01/bsprod/oradata/bsprod/corn01.dbf
channel ORA_DISK_1: restoring datafile 00009 to /u01/bsprod/oradata/bsprod/corn03.dbf
channel ORA_DISK_1: restoring datafile 00010 to /u01/bsprod/oradata/bsprod/lens001.dbf
channel ORA_DISK_1: reading from backup piece /u01/bsprod/rman/hot/BSPROD_4.rman
channel ORA_DISK_1: piece handle=/u01/bsprod/rman/hot/BSPROD_4.rman tag=TAG20240910T08500
channel ORA_DISK_1: restored backup piece 1
channel ORA_DISK_1: restore complete, elapsed time: 00:00:35
Finished restore at 21-SEP-24

RMAN> recover database datafile 1;

RMAN-00571: ===========================================================
RMAN-00569: =============== ERROR MESSAGE STACK FOLLOWS ===============
RMAN-00571: ===========================================================
RMAN-00558: error encountered while parsing input commands
RMAN-01009: syntax error: found "datafile": expecting one of: "allow, application, archivonvert, from, frompreplugin, from service, high, nonlogged, noparallel, noredo, notableim, skip, snapshot, tablespace, test, to restore point, undo, until restore point, until, u
RMAN-01007: at line 1 column 18 file: standard input

RMAN> recover datafile 1;

Starting recover at 21-SEP-24
using channel ORA_DISK_1
RMAN-00571: ===========================================================
RMAN-00569: =============== ERROR MESSAGE STACK FOLLOWS ===============
RMAN-00571: ===========================================================
RMAN-03002: failure of recover command at 09/21/2024 10:49:29
ORA-19698: /u01/bsprod/oradata/bsprod/redo01.log is from different database: id=324117275

RMAN> select member from v%logfile;


DBGSQL:     TARGET> select member from v%logfile
DBGSQL:
DBGSQL:        sqlcode = 911
RMAN-00571: ===========================================================
RMAN-00569: =============== ERROR MESSAGE STACK FOLLOWS ===============
RMAN-00571: ===========================================================
RMAN-03002: failure of sql statement command at 09/21/2024 10:50:23
ORA-00911: invalid character

RMAN> select member from v$logfile;



MEMBER
--------------------------------------------------------------------------------

/u01/bsprod/oradata/bsprod/redo03.log


/u01/bsprod/oradata/bsprod/redo02.log


/u01/bsprod/oradata/bsprod/redo01.log


RMAN> exit


Recovery Manager complete.
[oracle@srvr88 ~]$
[oracle@srvr88 ~]$
[oracle@srvr88 ~]$
[oracle@srvr88 ~]$
[oracle@srvr88 ~]$ cd $ORACLE_HOME/dbs
[oracle@srvr88 dbs]$ ls
1  hc_bsprod.dat  hc_bstest.dat  hc_MSPROD.dat  hc_orcl.dat  initbsprod.ora  init.ora  lk
[oracle@srvr88 dbs]$
[oracle@srvr88 dbs]$
[oracle@srvr88 dbs]$
[oracle@srvr88 dbs]$ vi initbsprod.ora
[oracle@srvr88 dbs]$ sqlplus / as sysdba

SQL*Plus: Release 19.0.0.0.0 - Production on Sat Sep 21 10:52:16 2024
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle.  All rights reserved.


Connected to:
Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0

SQL> create spfile from pfile;

File created.

SQL> shut abort
ORACLE instance shut down.
SQL> startup
ORACLE instance started.

Total System Global Area 1002437904 bytes
Fixed Size                  8903952 bytes
Variable Size             318767104 bytes
Database Buffers          671088640 bytes
Redo Buffers                3678208 bytes
Database mounted.
ORA-01113: file 1 needs media recovery
ORA-01110: data file 1: '/u01/bsprod/oradata/bsprod/system01.dbf'


SQL> exit
Disconnected from Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0
[oracle@srvr88 dbs]$ rman target/

Recovery Manager: Release 19.0.0.0.0 - Production on Sat Sep 21 10:53:11 2024
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle and/or its affiliates.  All rights reserved.

connected to target database: BSPROD (DBID=3457701842, not open)

RMAN> restore database
2> ;

Starting restore at 21-SEP-24
using target database control file instead of recovery catalog
allocated channel: ORA_DISK_1
channel ORA_DISK_1: SID=429 device type=DISK

skipping datafile 1; already restored to file /u01/bsprod/oradata/bsprod/system01.dbf
skipping datafile 2; already restored to file /u01/bsprod/oradata/bsprod/sysaux01.dbf
skipping datafile 3; already restored to file /u01/bsprod/oradata/bsprod/undotbs01.dbf
skipping datafile 4; already restored to file /u01/bsprod/oradata/bsprod/users01.dbf
skipping datafile 5; already restored to file /u01/bsprod/oradata/bsprod/defdata01.dbf
skipping datafile 6; already restored to file /u01/bsprod/oradata/bsprod/dudue01.dbf
skipping datafile 7; already restored to file /u01/bsprod/oradata/bsprod/dudue02.dbf
skipping datafile 8; already restored to file /u01/bsprod/oradata/bsprod/corn01.dbf
skipping datafile 9; already restored to file /u01/bsprod/oradata/bsprod/corn03.dbf
skipping datafile 10; already restored to file /u01/bsprod/oradata/bsprod/lens001.dbf
restore not done; all files read only, offline, excluded, or already restored
Finished restore at 21-SEP-24

RMAN> recover database;

Starting recover at 21-SEP-24
using channel ORA_DISK_1
RMAN-00571: ===========================================================
RMAN-00569: =============== ERROR MESSAGE STACK FOLLOWS ===============
RMAN-00571: ===========================================================
RMAN-03002: failure of recover command at 09/21/2024 10:53:33
ORA-19698: /u01/bsprod/oradata/bsprod/redo01.log is from different database: id=324117275

RMAN> restore database /u01/bsprod/oradata/bsprod/redo01.log;

RMAN-00571: ===========================================================
RMAN-00569: =============== ERROR MESSAGE STACK FOLLOWS ===============
RMAN-00571: ===========================================================
RMAN-00558: error encountered while parsing input commands
RMAN-01006: error signaled during parse
RMAN-02001: unrecognized punctuation symbol "/"

RMAN>  restore database '/u01/bsprod/oradata/bsprod/redo01.log';

Starting restore at 21-SEP-24
using channel ORA_DISK_1
RMAN-00571: ===========================================================
RMAN-00569: =============== ERROR MESSAGE STACK FOLLOWS ===============
RMAN-00571: ===========================================================
RMAN-03002: failure of restore command at 09/21/2024 10:54:46
RMAN-07537: command only allowed in a container database

RMAN> ^C
user interrupt received


RMAN>

RMAN> exit


Recovery Manager complete.
[oracle@srvr88 dbs]$ ls
1  hc_bsprod.dat  hc_bstest.dat  hc_MSPROD.dat  hc_orcl.dat  initbsprod.ora  init.ora  lk
[oracle@srvr88 dbs]$ mv /u01/bsprod/oradata/bsprod/redo01.log /u01/bsprod/oradata/bsprod/
[oracle@srvr88 dbs]$ ls
1  hc_bsprod.dat  hc_bstest.dat  hc_MSPROD.dat  hc_orcl.dat  initbsprod.ora  init.ora  lk
[oracle@srvr88 dbs]$ sqlplus / as sysdba;

SQL*Plus: Release 19.0.0.0.0 - Production on Sat Sep 21 10:57:42 2024
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle.  All rights reserved.


Connected to:
Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0

SQL> alter database open;
alter database open
*
ERROR at line 1:
ORA-01113: file 1 needs media recovery
ORA-01110: data file 1: '/u01/bsprod/oradata/bsprod/system01.dbf'


SQL> exit
Disconnected from Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0
[oracle@srvr88 dbs]$ rman target/

Recovery Manager: Release 19.0.0.0.0 - Production on Sat Sep 21 10:58:11 2024
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle and/or its affiliates.  All rights reserved.

connected to target database: BSPROD (DBID=3457701842, not open)

RMAN> recover datafile '/u01/bsprod/oradata/bsprod/system01.dbf';

Starting recover at 21-SEP-24
using target database control file instead of recovery catalog
allocated channel: ORA_DISK_1
channel ORA_DISK_1: SID=425 device type=DISK
RMAN-00571: ===========================================================
RMAN-00569: =============== ERROR MESSAGE STACK FOLLOWS ===============
RMAN-00571: ===========================================================
RMAN-03002: failure of recover command at 09/21/2024 10:58:39
ORA-19698: /u01/bsprod/oradata/bsprod/redo02.log is from different database: id=324117275

RMAN> exit


Recovery Manager complete.
[oracle@srvr88 dbs]$ ls
1  hc_bsprod.dat  hc_bstest.dat  hc_MSPROD.dat  hc_orcl.dat  initbsprod.ora  init.ora  lk
[oracle@srvr88 dbs]$ mv /u01/bsprod/oradata/bsprod/redo02.log /u01/bsprod/oradata/bsprod/
[oracle@srvr88 dbs]$ mv  /u01/bsprod/oradata/bsprod/redo03.log /u01/bsprod/oradata/bsprod
[oracle@srvr88 dbs]$ rman target/

Recovery Manager: Release 19.0.0.0.0 - Production on Sat Sep 21 10:59:47 2024
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle and/or its affiliates.  All rights reserved.

connected to target database: BSPROD (DBID=3457701842, not open)

RMAN> recover datafile '/u01/bsprod/oradata/bsprod/system01.dbf';

Starting recover at 21-SEP-24
using target database control file instead of recovery catalog
allocated channel: ORA_DISK_1
channel ORA_DISK_1: SID=429 device type=DISK

starting media recovery

archived log for thread 1 with sequence 14 is already on disk as file /u01/bsprod/arch/ar
archived log for thread 1 with sequence 15 is already on disk as file /u01/bsprod/arch/ar
archived log file name=/u01/bsprod/arch/arch_1_14_1106935381.log thread=1 sequence=14
archived log file name=/u01/bsprod/arch/arch_1_15_1106935381.log thread=1 sequence=15
RMAN-08187: warning: media recovery until SCN 1061218 complete
archived log file name=/u01/bsprod/arch/arch_1_15_1106935381.log thread=1 sequence=16
RMAN-00571: ===========================================================
RMAN-00569: =============== ERROR MESSAGE STACK FOLLOWS ===============
RMAN-00571: ===========================================================
RMAN-03002: failure of recover command at 09/21/2024 10:59:59
ORA-00283: recovery session canceled due to errors
RMAN-11003: failure during parse/execution of SQL statement: alter database recover logfi
ORA-00283: recovery session canceled due to errors
ORA-01112: media recovery not started
RMAN-06054: media recovery requesting unknown archived log for thread 1 with sequence 16

RMAN> exit


Recovery Manager complete.
[oracle@srvr88 dbs]$ sqlplus / as sysdba;

SQL*Plus: Release 19.0.0.0.0 - Production on Sat Sep 21 11:00:51 2024
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle.  All rights reserved.


Connected to:
Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0

SQL> select database_role from v$database;

DATABASE_ROLE
----------------
PRIMARY

SQL> exit
Disconnected from Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0
[oracle@srvr88 dbs]$ ls
1  hc_bsprod.dat  hc_bstest.dat  hc_MSPROD.dat  hc_orcl.dat  initbsprod.ora  init.ora  lk
[oracle@srvr88 dbs]$ rm -rf spfilebsprod.ora
[oracle@srvr88 dbs]$ la
bash: la: command not found...
[oracle@srvr88 dbs]$ ls
1  hc_bsprod.dat  hc_bstest.dat  hc_MSPROD.dat  hc_orcl.dat  initbsprod.ora  init.ora  lk
[oracle@srvr88 dbs]$ rm -rf *.dat
[oracle@srvr88 dbs]$ ls
1  initbsprod.ora  init.ora  lkBSPROD  lkBSTEST  lkMSPROD  lkORCL  orapwbsprod
[oracle@srvr88 dbs]$ cat initbsprod.ora
bsprod.__db_cache_size=671088640
bsprod.__java_pool_size=0
bsprod.__large_pool_size=4194304
bsprod.__oracle_base='/u01/app/oracle'#ORACLE_BASE set from environment
bsprod.__pga_aggregate_target=209715200
bsprod.__sga_target=1002438656
bsprod.__shared_io_pool_size=0
bsprod.__shared_pool_size=306184192
bsprod.__streams_pool_size=8388608
bsprod.__unified_pga_pool_size=0
*.audit_file_dest='/u01/app/oracle/admin/bsprod/adump'
*.audit_trail='DB'
*.compatible='11.2.0.4.0'
*.control_files='/u01/bsprod/oradata/bsprod/control01.ctl','/u01/bsprod/oradata/bsprod/co
*.db_block_size=8192
*.db_domain=''
*.db_name='bsprod'
*.db_unique_name='bsprod'
*.diagnostic_dest='/u01/app/oracle'
*.dispatchers='(PROTOCOL=TCP) (SERVICE=bsprodXDB)'
*.log_archive_dest_1='LOCATION=/u01/bsprod/arch/'
*.log_archive_format='arch_%t_%s_%r.log'
*.open_cursors=300
*.pga_aggregate_target=209715200
*.processes=300
*.remote_login_passwordfile='EXCLUSIVE'
*.sga_target=1002438656
*.undo_tablespace='UNDOTBS1'
[oracle@srvr88 dbs]$ lsnrctl start bsprod

LSNRCTL for Linux: Version 19.0.0.0.0 - Production on 21-SEP-2024 11:05:24

Copyright (c) 1991, 2019, Oracle.  All rights reserved.

TNS-01106: Listener using listener name bsprod has already been started
[oracle@srvr88 dbs]$ tnsping bsprod

TNS Ping Utility for Linux: Version 19.0.0.0.0 - Production on 21-SEP-2024 11:05:35

Copyright (c) 1997, 2019, Oracle.  All rights reserved.

Used parameter files:


Used TNSNAMES adapter to resolve the alias
Attempting to contact (DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.1.88)(PORT = 1521))) (CONNECT_DATA = (SERVICE_NAME = bsprod)))
OK (0 msec)
[oracle@srvr88 dbs]$ tnsping bsprod_dr

TNS Ping Utility for Linux: Version 19.0.0.0.0 - Production on 21-SEP-2024 11:05:48

Copyright (c) 1997, 2019, Oracle.  All rights reserved.

Used parameter files:


Used TNSNAMES adapter to resolve the alias
Attempting to contact (DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.1.98)(PORT = 1523))) (CONNECT_DATA = (SERVICE_NAME = bsprod)))
TNS-12541: TNS:no listener
[oracle@srvr88 dbs]$ cd $ORACLe_HOME/
[oracle@srvr88 /]$ cd network
-bash: cd: network: No such file or directory
[oracle@srvr88 /]$ ls
1    boot  etc   lib    media  opt   root  sbin  sys  u01  var
bin  dev   home  lib64  mnt    proc  run   srv   tmp  usr
[oracle@srvr88 /]$ cd $ORACLE_HOME/
[oracle@srvr88 db_home]$ cd network/
[oracle@srvr88 network]$ ls
admin  install  jlib  lib  log  mesg  tools  trace
[oracle@srvr88 network]$ cd admin/
[oracle@srvr88 admin]$ ls
listener.ora  samples  shrept.lst  tnsnames.ora
[oracle@srvr88 admin]$ vi listener.ora
[oracle@srvr88 admin]$       (GLOBAL_DBNAME = bsprod)
bash: GLOBAL_DBNAME: command not found...
[oracle@srvr88 admin]$       (ORACLE_HOME = /u01/app/oracle/product/19.3.0/db_home)
bash: ORACLE_HOME: command not found...
[oracle@srvr88 admin]$       (SID_NAME = bsprod)
bash: SID_NAME: command not found...
[oracle@srvr88 admin]$     )
-bash: syntax error near unexpected token `)'
[oracle@srvr88 admin]$   )
-bash: syntax error near unexpected token `)'
[oracle@srvr88 admin]$
[oracle@srvr88 admin]$ BSPROD =
bash: BSPROD: command not found...
[oracle@srvr88 admin]$   (DESCRIPTION =
>     (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.1.88)(PORT = 1521))
-bash: syntax error near unexpected token `('
[oracle@srvr88 admin]$   )
-bash: syntax error near unexpected token `)'
[oracle@srvr88 admin]$
[oracle@srvr88 admin]$ ADR_BASE_BSPROD = /u01/app/oracle
bash: ADR_BASE_BSPROD: command not found...
[oracle@srvr88 admin]$ vi listener.ora
[oracle@srvr88 admin]$ vi tnsnames.ora
[oracle@srvr88 admin]$ vi tnsnames.ora
[oracle@srvr88 admin]$ tnsping bsprod_dr

TNS Ping Utility for Linux: Version 19.0.0.0.0 - Production on 21-SEP-2024 11:13:14

Copyright (c) 1997, 2019, Oracle.  All rights reserved.

Used parameter files:


Used TNSNAMES adapter to resolve the alias
Attempting to contact (DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.1.98)(PORT = 1522))) (CONNECT_DATA = (SERVICE_NAME = bsprod)))
TNS-12541: TNS:no listener
[oracle@srvr88 admin]$ lsnrctl start bsprod

LSNRCTL for Linux: Version 19.0.0.0.0 - Production on 21-SEP-2024 11:13:27

Copyright (c) 1991, 2019, Oracle.  All rights reserved.

Starting /u01/app/oracle/product/19.3.0/db_home/bin/tnslsnr: please wait...

TNSLSNR for Linux: Version 19.0.0.0.0 - Production
System parameter file is /u01/app/oracle/product/19.3.0/db_home/network/admin/listener.ora
Log messages written to /u01/app/oracle/diag/tnslsnr/srvr88/bsprod/alert/log.xml
Listening on: (DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=192.168.1.98)(PORT=1522)))

Connecting to (DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=192.168.1.98)(PORT=1522)))
STATUS of the LISTENER
------------------------
Alias                     bsprod
Version                   TNSLSNR for Linux: Version 19.0.0.0.0 - Production
Start Date                21-SEP-2024 11:13:27
Uptime                    0 days 0 hr. 0 min. 0 sec
Trace Level               off
Security                  ON: Local OS Authentication
SNMP                      OFF
Listener Parameter File   /u01/app/oracle/product/19.3.0/db_home/network/admin/listener.ora
Listener Log File         /u01/app/oracle/diag/tnslsnr/srvr88/bsprod/alert/log.xml
Listening Endpoints Summary...
  (DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=192.168.1.98)(PORT=1522)))
Services Summary...
Service "bsprod" has 1 instance(s).
  Instance "bsprod", status UNKNOWN, has 1 handler(s) for this service...
The command completed successfully
[oracle@srvr88 admin]$ tnsping bsprod_dr

TNS Ping Utility for Linux: Version 19.0.0.0.0 - Production on 21-SEP-2024 11:13:30

Copyright (c) 1997, 2019, Oracle.  All rights reserved.

Used parameter files:


Used TNSNAMES adapter to resolve the alias
Attempting to contact (DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.1.98)(PORT = 1522))) (CONNECT_DATA = (SERVICE_NAME = bsprod)))
OK (0 msec)
[oracle@srvr88 admin]$ tnsping bsprod

TNS Ping Utility for Linux: Version 19.0.0.0.0 - Production on 21-SEP-2024 11:13:37

Copyright (c) 1997, 2019, Oracle.  All rights reserved.

Used parameter files:


Used TNSNAMES adapter to resolve the alias
Attempting to contact (DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.1.88)(PORT = 1521))) (CONNECT_DATA = (SERVICE_NAME = bsprod)))
OK (0 msec)
[oracle@srvr88 admin]$ sqlplus / as sysdba;

SQL*Plus: Release 19.0.0.0.0 - Production on Sat Sep 21 11:14:52 2024
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle.  All rights reserved.


Connected to:
Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0

SQL> shut immediate;
ORA-01109: database not open


Database dismounted.
ORACLE instance shut down.
SQL> startup nomount
ORACLE instance started.

Total System Global Area 1002437904 bytes
Fixed Size                  8903952 bytes
Variable Size             318767104 bytes
Database Buffers          671088640 bytes
Redo Buffers                3678208 bytes
SQL> exit
Disconnected from Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0
[oracle@srvr88 admin]$ rman target=sys/welcome@bsprod auxiliary=sys/welcome@bsprod_dr

Recovery Manager: Release 19.0.0.0.0 - Production on Sat Sep 21 11:16:13 2024
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle and/or its affiliates.  All rights reserved.

RMAN-00571: ===========================================================
RMAN-00569: =============== ERROR MESSAGE STACK FOLLOWS ===============
RMAN-00571: ===========================================================
RMAN-00554: initialization of internal recovery manager package failed
RMAN-04005: error from target database:
ORA-01017: invalid username/password; logon denied
[oracle@srvr88 admin]$ cd $ORACLE_HOME/dbs
[oracle@srvr88 dbs]$ ls
1              initbsprod.ora  lkBSPROD  lkMSPROD  orapwbsprod
hc_bsprod.dat  init.ora        lkBSTEST  lkORCL
[oracle@srvr88 dbs]$ rm -rf orapwbsprod
[oracle@srvr88 dbs]$ ls
1  hc_bsprod.dat  initbsprod.ora  init.ora  lkBSPROD  lkBSTEST  lkMSPROD  lkORCL
[oracle@srvr88 dbs]$
[oracle@srvr88 dbs]$ rm -rf hc_bsprod.dat
[oracle@srvr88 dbs]$ ls
1  initbsprod.ora  init.ora  lkBSPROD  lkBSTEST  lkMSPROD  lkORCL
[oracle@srvr88 dbs]$ pwd
/u01/app/oracle/product/19.3.0/db_home/dbs
[oracle@srvr88 dbs]$ ls
1  initbsprod.ora  init.ora  lkBSPROD  lkBSTEST  lkMSPROD  lkORCL
[oracle@srvr88 dbs]$ ls
1  initbsprod.ora  init.ora  lkBSPROD  lkBSTEST  lkMSPROD  lkORCL  orapwbsprod
[oracle@srvr88 dbs]$ rman target=sys/welcome@bsprod auxiliary=sys/welcome@bsprod_dr

Recovery Manager: Release 19.0.0.0.0 - Production on Sat Sep 21 11:20:43 2024
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle and/or its affiliates.  All rights reserved.

connected to target database: BSPROD (DBID=3457701842)
connected to auxiliary database: BSPROD (not mounted)

RMAN> duplicate target database for standby from active database
2> ;

Starting Duplicate Db at 21-SEP-24
using target database control file instead of recovery catalog
allocated channel: ORA_AUX_DISK_1
channel ORA_AUX_DISK_1: SID=390 device type=DISK

contents of Memory Script:
{
   backup as copy reuse
   passwordfile auxiliary format  '/u01/app/oracle/product/19.3.0/db_home/dbs/orapwbsprod'   ;
}
executing Memory Script

Starting backup at 21-SEP-24
allocated channel: ORA_DISK_1
channel ORA_DISK_1: SID=468 device type=DISK
Finished backup at 21-SEP-24

contents of Memory Script:
{
   restore clone from service  'bsprod' standby controlfile;
}
executing Memory Script

Starting restore at 21-SEP-24
using channel ORA_AUX_DISK_1

channel ORA_AUX_DISK_1: starting datafile backup set restore
channel ORA_AUX_DISK_1: using network backup set from service bsprod
channel ORA_AUX_DISK_1: restoring control file
channel ORA_AUX_DISK_1: restore complete, elapsed time: 00:00:02
output file name=/u01/bsprod/oradata/bsprod/control01.ctl
output file name=/u01/bsprod/oradata/bsprod/control02.ctl
Finished restore at 21-SEP-24

contents of Memory Script:
{
   sql clone 'alter database mount standby database';
}
executing Memory Script

sql statement: alter database mount standby database
RMAN-00571: ===========================================================
RMAN-00569: =============== ERROR MESSAGE STACK FOLLOWS ===============
RMAN-00571: ===========================================================
RMAN-03002: failure of Duplicate Db command at 09/21/2024 11:21:35
RMAN-05501: aborting duplication of target database
RMAN-05001: auxiliary file name /u01/bsprod/oradata/bsprod/ddb.dbf conflicts with a file used by the target database
RMAN-05001: auxiliary file name /u01/bsprod/oradata/bsprod/lens001.dbf conflicts with a file used by the target database
RMAN-05001: auxiliary file name /u01/bsprod/oradata/bsprod/corn03.dbf conflicts with a file used by the target database
RMAN-05001: auxiliary file name /u01/bsprod/oradata/bsprod/corn01.dbf conflicts with a file used by the target database
RMAN-05001: auxiliary file name /u01/bsprod/oradata/bsprod/dudue02.dbf conflicts with a file used by the target database
RMAN-05001: auxiliary file name /u01/bsprod/oradata/bsprod/dudue01.dbf conflicts with a file used by the target database
RMAN-05001: auxiliary file name /u01/bsprod/oradata/bsprod/defdata01.dbf conflicts with a file used by the target database
RMAN-05001: auxiliary file name /u01/bsprod/oradata/bsprod/users01.dbf conflicts with a file used by the target database
RMAN-05001: auxiliary file name /u01/bsprod/oradata/bsprod/undotbs01.dbf conflicts with a file used by the target database
RMAN-05001: auxiliary file name /u01/bsprod/oradata/bsprod/sysaux01.dbf conflicts with a file used by the target database
RMAN-05001: auxiliary file name /u01/bsprod/oradata/bsprod/system01.dbf conflicts with a file used by the target database

RMAN>  duplicate target database for standby from active database nofilenamecheck;

Starting Duplicate Db at 21-SEP-24
using channel ORA_AUX_DISK_1
RMAN-00571: ===========================================================
RMAN-00569: =============== ERROR MESSAGE STACK FOLLOWS ===============
RMAN-00571: ===========================================================
RMAN-03002: failure of Duplicate Db command at 09/21/2024 11:22:22
RMAN-05501: aborting duplication of target database
RMAN-05500: the auxiliary database must be not mounted when issuing a DUPLICATE command

RMAN> exit


Recovery Manager complete.
[oracle@srvr88 dbs]$ sqlplus / as sysdba;

SQL*Plus: Release 19.0.0.0.0 - Production on Sat Sep 21 11:22:38 2024
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle.  All rights reserved.


Connected to:
Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0

SQL> shutdown
ORA-01109: database not open


Database dismounted.
ORACLE instance shut down.
SQL> startup nomount;
ORACLE instance started.

Total System Global Area 1002437904 bytes
Fixed Size                  8903952 bytes
Variable Size             318767104 bytes
Database Buffers          671088640 bytes
Redo Buffers                3678208 bytes
SQL> exit
Disconnected from Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0
[oracle@srvr88 dbs]$ ls
1              initbsprod.ora  lkBSPROD  lkMSPROD  orapwbsprod
hc_bsprod.dat  init.ora        lkBSTEST  lkORCL
[oracle@srvr88 dbs]$ rman target=sys/welcome@bsprod auxiliary=sys/welcome@bsprod_dr

Recovery Manager: Release 19.0.0.0.0 - Production on Sat Sep 21 11:23:58 2024
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle and/or its affiliates.  All rights reserved.

connected to target database: BSPROD (DBID=3457701842)
connected to auxiliary database: BSPROD (not mounted)

RMAN> duplicate target database for standby from active database nofilenamecheck;

Starting Duplicate Db at 21-SEP-24
using target database control file instead of recovery catalog
allocated channel: ORA_AUX_DISK_1
channel ORA_AUX_DISK_1: SID=427 device type=DISK

contents of Memory Script:
{
   backup as copy reuse
   passwordfile auxiliary format  '/u01/app/oracle/product/19.3.0/db_home/dbs/orapwbsprod'   ;
}
executing Memory Script

Starting backup at 21-SEP-24
allocated channel: ORA_DISK_1
channel ORA_DISK_1: SID=450 device type=DISK
Finished backup at 21-SEP-24

contents of Memory Script:
{
   restore clone from service  'bsprod' standby controlfile;
}
executing Memory Script

Starting restore at 21-SEP-24
using channel ORA_AUX_DISK_1

channel ORA_AUX_DISK_1: starting datafile backup set restore
channel ORA_AUX_DISK_1: using network backup set from service bsprod
channel ORA_AUX_DISK_1: restoring control file
channel ORA_AUX_DISK_1: restore complete, elapsed time: 00:00:01
output file name=/u01/bsprod/oradata/bsprod/control01.ctl
output file name=/u01/bsprod/oradata/bsprod/control02.ctl
Finished restore at 21-SEP-24

contents of Memory Script:
{
   sql clone 'alter database mount standby database';
}
executing Memory Script

sql statement: alter database mount standby database
RMAN-05158: WARNING: auxiliary (datafile) file name /u01/bsprod/oradata/bsprod/system01.dbf conflicts with a file used by the target database
RMAN-05158: WARNING: auxiliary (datafile) file name /u01/bsprod/oradata/bsprod/sysaux01.dbf conflicts with a file used by the target database
RMAN-05158: WARNING: auxiliary (datafile) file name /u01/bsprod/oradata/bsprod/undotbs01.dbf conflicts with a file used by the target database
RMAN-05158: WARNING: auxiliary (datafile) file name /u01/bsprod/oradata/bsprod/users01.dbf conflicts with a file used by the target database
RMAN-05158: WARNING: auxiliary (datafile) file name /u01/bsprod/oradata/bsprod/defdata01.dbf conflicts with a file used by the target database
RMAN-05158: WARNING: auxiliary (datafile) file name /u01/bsprod/oradata/bsprod/dudue01.dbf conflicts with a file used by the target database
RMAN-05158: WARNING: auxiliary (datafile) file name /u01/bsprod/oradata/bsprod/dudue02.dbf conflicts with a file used by the target database
RMAN-05158: WARNING: auxiliary (datafile) file name /u01/bsprod/oradata/bsprod/corn01.dbf conflicts with a file used by the target database
RMAN-05158: WARNING: auxiliary (datafile) file name /u01/bsprod/oradata/bsprod/corn03.dbf conflicts with a file used by the target database
RMAN-05158: WARNING: auxiliary (datafile) file name /u01/bsprod/oradata/bsprod/lens001.dbf conflicts with a file used by the target database
RMAN-05158: WARNING: auxiliary (datafile) file name /u01/bsprod/oradata/bsprod/ddb.dbf conflicts with a file used by the target database
RMAN-05158: WARNING: auxiliary (tempfile) file name /u01/bsprod/oradata/bsprod/temp01.dbf conflicts with a file used by the target database
RMAN-05158: WARNING: auxiliary (tempfile) file name /u01/bsprod/oradata/bsprod/temp03.dbf conflicts with a file used by the target database

contents of Memory Script:
{
   set newname for tempfile  1 to
 "/u01/bsprod/oradata/bsprod/temp01.dbf";
   set newname for tempfile  2 to
 "/u01/bsprod/oradata/bsprod/temp03.dbf";
   switch clone tempfile all;
   set newname for datafile  1 to
 "/u01/bsprod/oradata/bsprod/system01.dbf";
   set newname for datafile  2 to
 "/u01/bsprod/oradata/bsprod/sysaux01.dbf";
   set newname for datafile  3 to
 "/u01/bsprod/oradata/bsprod/undotbs01.dbf";
   set newname for datafile  4 to
 "/u01/bsprod/oradata/bsprod/users01.dbf";
   set newname for datafile  5 to
 "/u01/bsprod/oradata/bsprod/defdata01.dbf";
   set newname for datafile  6 to
 "/u01/bsprod/oradata/bsprod/dudue01.dbf";
   set newname for datafile  7 to
 "/u01/bsprod/oradata/bsprod/dudue02.dbf";
   set newname for datafile  8 to
 "/u01/bsprod/oradata/bsprod/corn01.dbf";
   set newname for datafile  9 to
 "/u01/bsprod/oradata/bsprod/corn03.dbf";
   set newname for datafile  10 to
 "/u01/bsprod/oradata/bsprod/lens001.dbf";
   set newname for datafile  11 to
 "/u01/bsprod/oradata/bsprod/ddb.dbf";
   restore
   from service  'bsprod'   clone database
   ;
   sql 'alter system archive log current';
}
executing Memory Script

executing command: SET NEWNAME

executing command: SET NEWNAME

renamed tempfile 1 to /u01/bsprod/oradata/bsprod/temp01.dbf in control file
renamed tempfile 2 to /u01/bsprod/oradata/bsprod/temp03.dbf in control file

executing command: SET NEWNAME

executing command: SET NEWNAME

executing command: SET NEWNAME

executing command: SET NEWNAME

executing command: SET NEWNAME

executing command: SET NEWNAME

executing command: SET NEWNAME

executing command: SET NEWNAME

executing command: SET NEWNAME

executing command: SET NEWNAME

executing command: SET NEWNAME

Starting restore at 21-SEP-24
using channel ORA_AUX_DISK_1

channel ORA_AUX_DISK_1: starting datafile backup set restore
channel ORA_AUX_DISK_1: using network backup set from service bsprod
channel ORA_AUX_DISK_1: specifying datafile(s) to restore from backup set
channel ORA_AUX_DISK_1: restoring datafile 00001 to /u01/bsprod/oradata/bsprod/system01.dbf
channel ORA_AUX_DISK_1: restore complete, elapsed time: 00:01:09
channel ORA_AUX_DISK_1: starting datafile backup set restore
channel ORA_AUX_DISK_1: using network backup set from service bsprod
channel ORA_AUX_DISK_1: specifying datafile(s) to restore from backup set
channel ORA_AUX_DISK_1: restoring datafile 00002 to /u01/bsprod/oradata/bsprod/sysaux01.dbf
channel ORA_AUX_DISK_1: restore complete, elapsed time: 00:00:36
channel ORA_AUX_DISK_1: starting datafile backup set restore
channel ORA_AUX_DISK_1: using network backup set from service bsprod
channel ORA_AUX_DISK_1: specifying datafile(s) to restore from backup set
channel ORA_AUX_DISK_1: restoring datafile 00003 to /u01/bsprod/oradata/bsprod/undotbs01.dbf
channel ORA_AUX_DISK_1: restore complete, elapsed time: 00:00:26
channel ORA_AUX_DISK_1: starting datafile backup set restore
channel ORA_AUX_DISK_1: using network backup set from service bsprod
channel ORA_AUX_DISK_1: specifying datafile(s) to restore from backup set
channel ORA_AUX_DISK_1: restoring datafile 00004 to /u01/bsprod/oradata/bsprod/users01.dbf
channel ORA_AUX_DISK_1: restore complete, elapsed time: 00:00:01
channel ORA_AUX_DISK_1: starting datafile backup set restore
channel ORA_AUX_DISK_1: using network backup set from service bsprod
channel ORA_AUX_DISK_1: specifying datafile(s) to restore from backup set
channel ORA_AUX_DISK_1: restoring datafile 00005 to /u01/bsprod/oradata/bsprod/defdata01.dbf
channel ORA_AUX_DISK_1: restore complete, elapsed time: 00:00:01
channel ORA_AUX_DISK_1: starting datafile backup set restore
channel ORA_AUX_DISK_1: using network backup set from service bsprod
channel ORA_AUX_DISK_1: specifying datafile(s) to restore from backup set
channel ORA_AUX_DISK_1: restoring datafile 00006 to /u01/bsprod/oradata/bsprod/dudue01.dbf
channel ORA_AUX_DISK_1: restore complete, elapsed time: 00:00:01
channel ORA_AUX_DISK_1: starting datafile backup set restore
channel ORA_AUX_DISK_1: using network backup set from service bsprod
channel ORA_AUX_DISK_1: specifying datafile(s) to restore from backup set
channel ORA_AUX_DISK_1: restoring datafile 00007 to /u01/bsprod/oradata/bsprod/dudue02.dbf
channel ORA_AUX_DISK_1: restore complete, elapsed time: 00:00:01
channel ORA_AUX_DISK_1: starting datafile backup set restore
channel ORA_AUX_DISK_1: using network backup set from service bsprod
channel ORA_AUX_DISK_1: specifying datafile(s) to restore from backup set
channel ORA_AUX_DISK_1: restoring datafile 00008 to /u01/bsprod/oradata/bsprod/corn01.dbf
channel ORA_AUX_DISK_1: restore complete, elapsed time: 00:00:01
channel ORA_AUX_DISK_1: starting datafile backup set restore
channel ORA_AUX_DISK_1: using network backup set from service bsprod
channel ORA_AUX_DISK_1: specifying datafile(s) to restore from backup set
channel ORA_AUX_DISK_1: restoring datafile 00009 to /u01/bsprod/oradata/bsprod/corn03.dbf
channel ORA_AUX_DISK_1: restore complete, elapsed time: 00:00:01
channel ORA_AUX_DISK_1: starting datafile backup set restore
channel ORA_AUX_DISK_1: using network backup set from service bsprod
channel ORA_AUX_DISK_1: specifying datafile(s) to restore from backup set
channel ORA_AUX_DISK_1: restoring datafile 00010 to /u01/bsprod/oradata/bsprod/lens001.dbf
channel ORA_AUX_DISK_1: restore complete, elapsed time: 00:00:01
channel ORA_AUX_DISK_1: starting datafile backup set restore
channel ORA_AUX_DISK_1: using network backup set from service bsprod
channel ORA_AUX_DISK_1: specifying datafile(s) to restore from backup set
channel ORA_AUX_DISK_1: restoring datafile 00011 to /u01/bsprod/oradata/bsprod/ddb.dbf
channel ORA_AUX_DISK_1: restore complete, elapsed time: 00:00:01
Finished restore at 21-SEP-24

sql statement: alter system archive log current

contents of Memory Script:
{
   switch clone datafile all;
}
executing Memory Script

datafile 1 switched to datafile copy
input datafile copy RECID=1 STAMP=1180265203 file name=/u01/bsprod/oradata/bsprod/system01.dbf
datafile 2 switched to datafile copy
input datafile copy RECID=2 STAMP=1180265203 file name=/u01/bsprod/oradata/bsprod/sysaux01.dbf
datafile 3 switched to datafile copy
input datafile copy RECID=3 STAMP=1180265203 file name=/u01/bsprod/oradata/bsprod/undotbs01.dbf
datafile 4 switched to datafile copy
input datafile copy RECID=4 STAMP=1180265203 file name=/u01/bsprod/oradata/bsprod/users01.dbf
datafile 5 switched to datafile copy
input datafile copy RECID=5 STAMP=1180265203 file name=/u01/bsprod/oradata/bsprod/defdata01.dbf
datafile 6 switched to datafile copy
input datafile copy RECID=6 STAMP=1180265203 file name=/u01/bsprod/oradata/bsprod/dudue01.dbf
datafile 7 switched to datafile copy
input datafile copy RECID=7 STAMP=1180265203 file name=/u01/bsprod/oradata/bsprod/dudue02.dbf
datafile 8 switched to datafile copy
input datafile copy RECID=8 STAMP=1180265203 file name=/u01/bsprod/oradata/bsprod/corn01.dbf
datafile 9 switched to datafile copy
input datafile copy RECID=9 STAMP=1180265203 file name=/u01/bsprod/oradata/bsprod/corn03.dbf
datafile 10 switched to datafile copy
input datafile copy RECID=10 STAMP=1180265203 file name=/u01/bsprod/oradata/bsprod/lens001.dbf
datafile 11 switched to datafile copy
input datafile copy RECID=11 STAMP=1180265203 file name=/u01/bsprod/oradata/bsprod/ddb.dbf
RMAN-05535: warning: All redo log files were not defined properly.
RMAN-05535: warning: All redo log files were not defined properly.
RMAN-05535: warning: All redo log files were not defined properly.
Finished Duplicate Db at 21-SEP-24

RMAN> exit


Recovery Manager complete.
[oracle@srvr88 dbs]$ ls
1              initbsprod.ora  lkBSPROD  lkMSPROD  orapwbsprod
hc_bsprod.dat  init.ora        lkBSTEST  lkORCL
[oracle@srvr88 dbs]$ mv /u
u01/ usr/
[oracle@srvr88 dbs]$ mv /u01/bsprod/oradata/bsprod/redo01.log_old /u01/bsprod/oradata/bsprod/redo01.log
[oracle@srvr88 dbs]$  mv /u01/bsprod/oradata/bsprod/redo02.log_old /u01/bsprod/oradata/bsprod/redo01.log
[oracle@srvr88 dbs]$  mv /u01/bsprod/oradata/bsprod/redo03.log_old /u01/bsprod/oradata/bsprod/redo01.log
[oracle@srvr88 dbs]$
[oracle@srvr88 dbs]$ cd /u01/bsprod/oradata/bsprod/
[oracle@srvr88 bsprod]$ ls
control01.ctl  corn03.dbf     dudue01.dbf  redo01.log    temp01.dbf     users01.dbf
control02.ctl  ddb.dbf        dudue02.dbf  sysaux01.dbf  temp03.dbf
corn01.dbf     defdata01.dbf  lens001.dbf  system01.dbf  undotbs01.dbf
[oracle@srvr88 bsprod]$ sqlplus /as sysdba

SQL*Plus: Release 19.0.0.0.0 - Production
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle.  All rights reserved.

Use SQL*Plus to execute SQL, PL/SQL and SQL*Plus statements.

Usage 1: sqlplus -H | -V

    -H             Displays the SQL*Plus version and the
                   usage help.
    -V             Displays the SQL*Plus version.

Usage 2: sqlplus [ [<option>] [{logon | /nolog}] [<start>] ]

  <option> is: [-AC] [-C <version>] [-F] [-L] [-M "<options>"] [-NOLOGINTIME]
               [-R <level>] [-S]

    -AC            Enable Application Continuity.
    -C <version>   Sets the compatibility of affected commands to the
                   version specified by <version>.  The version has
                   the form "x.y[.z]".  For example, -C 10.2.0
    -F             This option improves performance in general. It changes
                   the default values settings.
                   See SQL*Plus User's Guide for the detailed settings.
    -L             Attempts to log on just once, instead of
                   reprompting on error.
    -M "<options>" Sets automatic HTML or CSV markup of output.  The options
                   have the form:
                   {HTML html_options|CSV csv_options}
                   See SQL*Plus User's Guide for detailed HTML and CSV options.
    -NOLOGINTIME   Don't display Last Successful Login Time.
    -R <level>     Sets restricted mode to disable SQL*Plus commands
                   that interact with the file system.  The level can
                   be 1, 2 or 3.  The most restrictive is -R 3 which
                   disables all user commands interacting with the
                   file system.
    -S             Sets silent mode which suppresses the display of
                   the SQL*Plus banner, prompts, and echoing of
                   commands.

  <logon> is: {<username>[/<password>][@<connect_identifier>] | / }
              [AS {SYSDBA | SYSOPER | SYSASM | SYSBACKUP | SYSDG
              | SYSKM | SYSRAC}] [EDITION=value]

    Specifies the database account username, password and connect
    identifier for the database connection.  Without a connect
    identifier, SQL*Plus connects to the default database.

    The AS SYSDBA, AS SYSOPER, AS SYSASM, AS SYSBACKUP, AS SYSDG,
    AS SYSKM and AS SYSRAC options are database administration privileges.

    <connect_identifier> can be in the form of Net Service Name
    or Easy Connect.

      @[<net_service_name> | [[//]Host[:Port]/<service_name>] |
        [[[protocol:]//]host1{,host12}[:port1]{,host2:port2}[/service_name]
         [:server][/instance_name][?[parameter_name=value]
         {&parameter_name=value}]]]

        <net_service_name> is a simple name for a service that resolves
        to a connect descriptor.

        Example: Connect to database using Net Service Name and the
                 database net service name is ORCL.

           sqlplus myusername/mypassword@ORCL

        Host specifies the host name or IP address of the database
        server computer.

        Port specifies the listening port on the database server.

        <service_name> specifies the service name of the database you
        want to access.

        Example: Connect to database using Easy Connect and the
                 Service name is ORCL.

           sqlplus myusername/mypassword@Host/ORCL

    The /NOLOG option starts SQL*Plus without connecting to a
    database.

    The EDITION specifies the value for Session Edition.


  <start> is: @<URL>|<filename>[.<ext>] [<parameter> ...]

    Runs the specified SQL*Plus script from a web server (URL) or the
    local file system (filename.ext) with specified parameters that
    will be assigned to substitution variables in the script.

When SQL*Plus starts, and after CONNECT commands, the site profile
(e.g. $ORACLE_HOME/sqlplus/admin/glogin.sql) and the user profile
(e.g. login.sql in the working directory) are run.  The files may
contain SQL*Plus commands.

Refer to the SQL*Plus User's Guide and Reference for more information.
[oracle@srvr88 bsprod]$ sqlplus / as sysdba;

SQL*Plus: Release 19.0.0.0.0 - Production on Sat Sep 21 11:30:14 2024
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle.  All rights reserved.


Connected to:
Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0

SQL> select database_role from v$database;

DATABASE_ROLE
----------------
PHYSICAL STANDBY

SQL> select member from v$logfile;

MEMBER
--------------------------------------------------------------------------------
/u01/app/oracle/product/19.3.0/db_home/dbs/broken2
/u01/app/oracle/product/19.3.0/db_home/dbs/broken1
/u01/app/oracle/product/19.3.0/db_home/dbs/broken0

SQL> shut immedate
SP2-0717: illegal SHUTDOWN option
SQL> shut immediate
ORA-01109: database not open


Database dismounted.
ORACLE instance shut down.
SQL> startup
ORACLE instance started.

Total System Global Area 1002437904 bytes
Fixed Size                  8903952 bytes
Variable Size             318767104 bytes
Database Buffers          671088640 bytes
Redo Buffers                3678208 bytes
Database mounted.
ORA-10458: standby database requires recovery
ORA-01152: file 1 was not restored from a sufficiently old backup
ORA-01110: data file 1: '/u01/bsprod/oradata/bsprod/system01.dbf'


SQL> exit
Disconnected from Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0
[oracle@srvr88 bsprod]$ cd ~
[oracle@srvr88 ~]$ cd $ORACLE_HOME
$ORACLE_HOME
[oracle@srvr88 ~]$ cd $ORACLE_HOME
$ORACLE_HOME
[oracle@srvr88 ~]$ cd $ORACLE_HOME/dbs
[oracle@srvr88 dbs]$ ls
1              initbsprod.ora  lkBSPROD  lkMSPROD  orapwbsprod
hc_bsprod.dat  init.ora        lkBSTEST  lkORCL
[oracle@srvr88 dbs]$ sqlplus / as sysdba;

SQL*Plus: Release 19.0.0.0.0 - Production on Sat Sep 21 11:35:31 2024
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle.  All rights reserved.


Connected to:
Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0

SQL> create spfile from pfile;

File created.

SQL> exit
Disconnected from Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0
[oracle@srvr88 dbs]$ ls
1              initbsprod.ora  lkBSPROD  lkMSPROD  orapwbsprod
hc_bsprod.dat  init.ora        lkBSTEST  lkORCL    spfilebsprod.ora
[oracle@srvr88 dbs]$ sqlplus / as sysdba;

SQL*Plus: Release 19.0.0.0.0 - Production on Sat Sep 21 11:35:55 2024
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle.  All rights reserved.


Connected to:
Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0

SQL> show parameter spfile;

NAME                                 TYPE        VALUE
------------------------------------ ----------- ------------------------------
spfile                               string
SQL> shut abort
ORACLE instance shut down.
SQL> startup
ORACLE instance started.

Total System Global Area 1002437904 bytes
Fixed Size                  8903952 bytes
Variable Size             318767104 bytes
Database Buffers          671088640 bytes
Redo Buffers                3678208 bytes
Database mounted.
ORA-10458: standby database requires recovery
ORA-01152: file 1 was not restored from a sufficiently old backup
ORA-01110: data file 1: '/u01/bsprod/oradata/bsprod/system01.dbf'


SQL> exi
SP2-0042: unknown command "exi" - rest of line ignored.
SQL> exit
Disconnected from Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0
[oracle@srvr88 dbs]$ mkdir -p /u01/bsprod/backup/hot
[oracle@srvr88 dbs]$ ^C
[oracle@srvr88 dbs]$ cd /u01/bsprod/backup/hot
[oracle@srvr88 hot]$ ll
total 0
[oracle@srvr88 hot]$ ls
[oracle@srvr88 hot]$ ls
BSPROD_51.rman  BSPROD_52.rman  BSPROD_53.rman  BSPROD_54.rman  BSPROD_55.rman
[oracle@srvr88 hot]$ ls -ll
total 1582132
-rw-r----- 1 oracle oinstall   81016832 Sep 21 11:48 BSPROD_51.rman
-rw-r----- 1 oracle oinstall 1518493696 Sep 21 11:49 BSPROD_52.rman
-rw-r----- 1 oracle oinstall   10305536 Sep 21 11:49 BSPROD_53.rman
-rw-r----- 1 oracle oinstall   10272768 Sep 21 11:49 BSPROD_54.rman
-rw-r----- 1 oracle oinstall      10752 Sep 21 11:49 BSPROD_55.rman
[oracle@srvr88 hot]$ ls
BSPROD_51.rman  BSPROD_52.rman  BSPROD_53.rman  BSPROD_54.rman  BSPROD_55.rman
[oracle@srvr88 hot]$ rman target/

Recovery Manager: Release 19.0.0.0.0 - Production on Sat Sep 21 11:53:04 2024
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle and/or its affiliates.  All rights reserved.

connected to target database: BSPROD (DBID=3457701842, not open)

RMAN> CATALOG START WITH '/u01/bsprod/backup/hot';

using target database control file instead of recovery catalog
searching for all files that match the pattern /u01/bsprod/backup/hot

List of Files Unknown to the Database
=====================================
File Name: /u01/bsprod/backup/hot/BSPROD_51.rman
File Name: /u01/bsprod/backup/hot/BSPROD_52.rman
File Name: /u01/bsprod/backup/hot/BSPROD_53.rman
File Name: /u01/bsprod/backup/hot/BSPROD_54.rman
File Name: /u01/bsprod/backup/hot/BSPROD_55.rman

Do you really want to catalog the above files (enter YES or NO)? YES
cataloging files...
cataloging done

List of Cataloged Files
=======================
File Name: /u01/bsprod/backup/hot/BSPROD_51.rman
File Name: /u01/bsprod/backup/hot/BSPROD_52.rman
File Name: /u01/bsprod/backup/hot/BSPROD_53.rman
File Name: /u01/bsprod/backup/hot/BSPROD_54.rman
File Name: /u01/bsprod/backup/hot/BSPROD_55.rman

RMAN> list backup
2> ;


List of Backup Sets
===================


BS Key  Type LV Size       Device Type Elapsed Time Completion Time
------- ---- -- ---------- ----------- ------------ ---------------
1       Full    1002.41M   DISK        00:00:29     10-SEP-24
        BP Key: 1   Status: AVAILABLE  Compressed: NO  Tag: TAG20240910T084320
        Piece Name: /u01/bsprod/rman/cold/BSPROD_1.rman
  List of Datafiles in backup set 1
  File LV Type Ckp SCN    Ckp Time  Abs Fuz SCN Sparse Name
  ---- -- ---- ---------- --------- ----------- ------ ----
  1       Full 1036502    10-SEP-24              NO    /u01/bsprod/oradata/bsprod/system01.dbf
  2       Full 1036502    10-SEP-24              NO    /u01/bsprod/oradata/bsprod/sysaux01.dbf
  3       Full 1036502    10-SEP-24              NO    /u01/bsprod/oradata/bsprod/undotbs01.dbf
  4       Full 1036502    10-SEP-24              NO    /u01/bsprod/oradata/bsprod/users01.dbf
  5       Full 997462     09-SEP-24              NO    /u01/bsprod/oradata/bsprod/defdata01.dbf
  6       Full 1036502    10-SEP-24              NO    /u01/bsprod/oradata/bsprod/dudue01.dbf
  7       Full 1036502    10-SEP-24              NO    /u01/bsprod/oradata/bsprod/dudue02.dbf
  8       Full 1036502    10-SEP-24              NO    /u01/bsprod/oradata/bsprod/corn01.dbf
  9       Full 1036502    10-SEP-24              NO    /u01/bsprod/oradata/bsprod/corn03.dbf
  10      Full 1036502    10-SEP-24              NO    /u01/bsprod/oradata/bsprod/lens001.dbf

BS Key  Type LV Size       Device Type Elapsed Time Completion Time
------- ---- -- ---------- ----------- ------------ ---------------
2       Full    9.36M      DISK        00:00:01     10-SEP-24
        BP Key: 2   Status: AVAILABLE  Compressed: NO  Tag: TAG20240910T084320
        Piece Name: /u01/bsprod/rman/cold/BSPROD_2.rman
  SPFILE Included: Modification time: 10-SEP-24
  SPFILE db_unique_name: BSPROD
  Control File Included: Ckp SCN: 1036515      Ckp time: 10-SEP-24

BS Key  Size       Device Type Elapsed Time Completion Time
------- ---------- ----------- ------------ ---------------
3       3.59M      DISK        00:00:00     10-SEP-24
        BP Key: 3   Status: AVAILABLE  Compressed: NO  Tag: TAG20240910T085007
        Piece Name: /u01/bsprod/rman/hot/BSPROD_3.rman

  List of Archived Logs in backup set 3
  Thrd Seq     Low SCN    Low Time  Next SCN   Next Time
  ---- ------- ---------- --------- ---------- ---------
  1    8       1034837    10-SEP-24 1035686    10-SEP-24
  1    9       1035686    10-SEP-24 1035700    10-SEP-24
  1    10      1035700    10-SEP-24 1035714    10-SEP-24
  1    11      1035714    10-SEP-24 1035739    10-SEP-24
  1    12      1035739    10-SEP-24 1036058    10-SEP-24
  1    13      1036058    10-SEP-24 1036686    10-SEP-24

BS Key  Type LV Size       Device Type Elapsed Time Completion Time
------- ---- -- ---------- ----------- ------------ ---------------
4       Full    1002.43M   DISK        00:00:06     10-SEP-24
        BP Key: 4   Status: AVAILABLE  Compressed: NO  Tag: TAG20240910T085008
        Piece Name: /u01/bsprod/rman/hot/BSPROD_4.rman
  List of Datafiles in backup set 4
  File LV Type Ckp SCN    Ckp Time  Abs Fuz SCN Sparse Name
  ---- -- ---- ---------- --------- ----------- ------ ----
  1       Full 1036694    10-SEP-24              NO    /u01/bsprod/oradata/bsprod/system01.dbf
  2       Full 1036694    10-SEP-24              NO    /u01/bsprod/oradata/bsprod/sysaux01.dbf
  3       Full 1036694    10-SEP-24              NO    /u01/bsprod/oradata/bsprod/undotbs01.dbf
  4       Full 1036694    10-SEP-24              NO    /u01/bsprod/oradata/bsprod/users01.dbf
  5       Full 997462     09-SEP-24              NO    /u01/bsprod/oradata/bsprod/defdata01.dbf
  6       Full 1036694    10-SEP-24              NO    /u01/bsprod/oradata/bsprod/dudue01.dbf
  7       Full 1036694    10-SEP-24              NO    /u01/bsprod/oradata/bsprod/dudue02.dbf
  8       Full 1036694    10-SEP-24              NO    /u01/bsprod/oradata/bsprod/corn01.dbf
  9       Full 1036694    10-SEP-24              NO    /u01/bsprod/oradata/bsprod/corn03.dbf
  10      Full 1036694    10-SEP-24              NO    /u01/bsprod/oradata/bsprod/lens001.dbf

BS Key  Type LV Size       Device Type Elapsed Time Completion Time
------- ---- -- ---------- ----------- ------------ ---------------
5       Full    9.36M      DISK        00:00:01     10-SEP-24
        BP Key: 5   Status: AVAILABLE  Compressed: NO  Tag: TAG20240910T085008
        Piece Name: /u01/bsprod/rman/hot/BSPROD_5.rman
  SPFILE Included: Modification time: 10-SEP-24
  SPFILE db_unique_name: BSPROD
  Control File Included: Ckp SCN: 1036696      Ckp time: 10-SEP-24

BS Key  Type LV Size       Device Type Elapsed Time Completion Time
------- ---- -- ---------- ----------- ------------ ---------------
6       Full    9.33M      DISK        00:00:01     10-SEP-24
        BP Key: 6   Status: AVAILABLE  Compressed: NO  Tag: TAG20240910T085008
        Piece Name: /u01/bsprod/rman/hot/BSPROD_6.rman
  Control File Included: Ckp SCN: 1036697      Ckp time: 10-SEP-24

BS Key  Size       Device Type Elapsed Time Completion Time
------- ---------- ----------- ------------ ---------------
7       3.00K      DISK        00:00:00     10-SEP-24
        BP Key: 7   Status: AVAILABLE  Compressed: NO  Tag: TAG20240910T085020
        Piece Name: /u01/bsprod/rman/hot/BSPROD_7.rman

  List of Archived Logs in backup set 7
  Thrd Seq     Low SCN    Low Time  Next SCN   Next Time
  ---- ------- ---------- --------- ---------- ---------
  1    14      1036686    10-SEP-24 1036703    10-SEP-24

BS Key  Size       Device Type Elapsed Time Completion Time
------- ---------- ----------- ------------ ---------------
8       15.44M     DISK        00:00:01     16-SEP-24
        BP Key: 8   Status: AVAILABLE  Compressed: NO  Tag: TAG20240916T113317
        Piece Name: /u01/bsprod/rman/BSPROD_10.rman

  List of Archived Logs in backup set 8
  Thrd Seq     Low SCN    Low Time  Next SCN   Next Time
  ---- ------- ---------- --------- ---------- ---------
  1    8       1034837    10-SEP-24 1035686    10-SEP-24
  1    9       1035686    10-SEP-24 1035700    10-SEP-24
  1    10      1035700    10-SEP-24 1035714    10-SEP-24
  1    11      1035714    10-SEP-24 1035739    10-SEP-24
  1    12      1035739    10-SEP-24 1036058    10-SEP-24
  1    13      1036058    10-SEP-24 1036686    10-SEP-24
  1    14      1036686    10-SEP-24 1036703    10-SEP-24
  1    15      1036703    10-SEP-24 1061218    11-SEP-24
  1    134     2644752    16-SEP-24 2651391    16-SEP-24
  1    135     2651391    16-SEP-24 2651728    16-SEP-24

BS Key  Type LV Size       Device Type Elapsed Time Completion Time
------- ---- -- ---------- ----------- ------------ ---------------
9       Full    1.40G      DISK        00:00:47     16-SEP-24
        BP Key: 9   Status: AVAILABLE  Compressed: NO  Tag: TAG20240916T113318
        Piece Name: /u01/bsprod/rman/BSPROD_11.rman
  List of Datafiles in backup set 9
  File LV Type Ckp SCN    Ckp Time  Abs Fuz SCN Sparse Name
  ---- -- ---- ---------- --------- ----------- ------ ----
  1       Full 2651745    16-SEP-24              NO    /u01/bsprod/oradata/bsprod/system01.dbf
  2       Full 2651745    16-SEP-24              NO    /u01/bsprod/oradata/bsprod/sysaux01.dbf
  3       Full 2651745    16-SEP-24              NO    /u01/bsprod/oradata/bsprod/undotbs01.dbf
  4       Full 2651745    16-SEP-24              NO    /u01/bsprod/oradata/bsprod/users01.dbf
  5       Full 2651745    16-SEP-24              NO    /u01/bsprod/oradata/bsprod/defdata01.dbf
  6       Full 2651745    16-SEP-24              NO    /u01/bsprod/oradata/bsprod/dudue01.dbf
  7       Full 2651745    16-SEP-24              NO    /u01/bsprod/oradata/bsprod/dudue02.dbf
  8       Full 2651745    16-SEP-24              NO    /u01/bsprod/oradata/bsprod/corn01.dbf
  9       Full 2651745    16-SEP-24              NO    /u01/bsprod/oradata/bsprod/corn03.dbf
  10      Full 2651745    16-SEP-24              NO    /u01/bsprod/oradata/bsprod/lens001.dbf

BS Key  Type LV Size       Device Type Elapsed Time Completion Time
------- ---- -- ---------- ----------- ------------ ---------------
10      Full    9.81M      DISK        00:00:01     16-SEP-24
        BP Key: 10   Status: AVAILABLE  Compressed: NO  Tag: TAG20240916T113318
        Piece Name: /u01/bsprod/rman/BSPROD_12.rman
  SPFILE Included: Modification time: 16-SEP-24
  SPFILE db_unique_name: BSPROD
  Control File Included: Ckp SCN: 2651766      Ckp time: 16-SEP-24

BS Key  Type LV Size       Device Type Elapsed Time Completion Time
------- ---- -- ---------- ----------- ------------ ---------------
11      Full    9.78M      DISK        00:00:01     16-SEP-24
        BP Key: 11   Status: AVAILABLE  Compressed: NO  Tag: TAG20240916T113318
        Piece Name: /u01/bsprod/rman/BSPROD_13.rman
  Control File Included: Ckp SCN: 2651767      Ckp time: 16-SEP-24

BS Key  Size       Device Type Elapsed Time Completion Time
------- ---------- ----------- ------------ ---------------
12      4.00K      DISK        00:00:00     16-SEP-24
        BP Key: 12   Status: AVAILABLE  Compressed: NO  Tag: TAG20240916T113418
        Piece Name: /u01/bsprod/rman/BSPROD_14.rman

  List of Archived Logs in backup set 12
  Thrd Seq     Low SCN    Low Time  Next SCN   Next Time
  ---- ------- ---------- --------- ---------- ---------
  1    136     2651728    16-SEP-24 2651773    16-SEP-24

BS Key  Size       Device Type Elapsed Time Completion Time
------- ---------- ----------- ------------ ---------------
13      15.63M     DISK        00:00:01     16-SEP-24
        BP Key: 13   Status: AVAILABLE  Compressed: NO  Tag: TAG20240916T113709
        Piece Name: /u01/bsprod/rman/BSPROD_15.rman

  List of Archived Logs in backup set 13
  Thrd Seq     Low SCN    Low Time  Next SCN   Next Time
  ---- ------- ---------- --------- ---------- ---------
  1    8       1034837    10-SEP-24 1035686    10-SEP-24
  1    9       1035686    10-SEP-24 1035700    10-SEP-24
  1    10      1035700    10-SEP-24 1035714    10-SEP-24
  1    11      1035714    10-SEP-24 1035739    10-SEP-24
  1    12      1035739    10-SEP-24 1036058    10-SEP-24
  1    13      1036058    10-SEP-24 1036686    10-SEP-24
  1    14      1036686    10-SEP-24 1036703    10-SEP-24
  1    15      1036703    10-SEP-24 1061218    11-SEP-24
  1    134     2644752    16-SEP-24 2651391    16-SEP-24
  1    135     2651391    16-SEP-24 2651728    16-SEP-24
  1    136     2651728    16-SEP-24 2651773    16-SEP-24
  1    137     2651773    16-SEP-24 2652398    16-SEP-24

BS Key  Type LV Size       Device Type Elapsed Time Completion Time
------- ---- -- ---------- ----------- ------------ ---------------
14      Full    1.41G      DISK        00:00:33     16-SEP-24
        BP Key: 14   Status: AVAILABLE  Compressed: NO  Tag: TAG20240916T113710
        Piece Name: /u01/bsprod/rman/BSPROD_16.rman
  List of Datafiles in backup set 14
  File LV Type Ckp SCN    Ckp Time  Abs Fuz SCN Sparse Name
  ---- -- ---- ---------- --------- ----------- ------ ----
  1       Full 2652410    16-SEP-24              NO    /u01/bsprod/oradata/bsprod/system01.dbf
  2       Full 2652410    16-SEP-24              NO    /u01/bsprod/oradata/bsprod/sysaux01.dbf
  3       Full 2652410    16-SEP-24              NO    /u01/bsprod/oradata/bsprod/undotbs01.dbf
  4       Full 2652410    16-SEP-24              NO    /u01/bsprod/oradata/bsprod/users01.dbf
  5       Full 2652410    16-SEP-24              NO    /u01/bsprod/oradata/bsprod/defdata01.dbf
  6       Full 2652410    16-SEP-24              NO    /u01/bsprod/oradata/bsprod/dudue01.dbf
  7       Full 2652410    16-SEP-24              NO    /u01/bsprod/oradata/bsprod/dudue02.dbf
  8       Full 2652410    16-SEP-24              NO    /u01/bsprod/oradata/bsprod/corn01.dbf
  9       Full 2652410    16-SEP-24              NO    /u01/bsprod/oradata/bsprod/corn03.dbf
  10      Full 2652410    16-SEP-24              NO    /u01/bsprod/oradata/bsprod/lens001.dbf

BS Key  Type LV Size       Device Type Elapsed Time Completion Time
------- ---- -- ---------- ----------- ------------ ---------------
15      Full    9.81M      DISK        00:00:01     16-SEP-24
        BP Key: 15   Status: AVAILABLE  Compressed: NO  Tag: TAG20240916T113710
        Piece Name: /u01/bsprod/rman/BSPROD_17.rman
  SPFILE Included: Modification time: 16-SEP-24
  SPFILE db_unique_name: BSPROD
  Control File Included: Ckp SCN: 2652427      Ckp time: 16-SEP-24

BS Key  Type LV Size       Device Type Elapsed Time Completion Time
------- ---- -- ---------- ----------- ------------ ---------------
16      Full    9.78M      DISK        00:00:01     16-SEP-24
        BP Key: 16   Status: AVAILABLE  Compressed: NO  Tag: TAG20240916T113710
        Piece Name: /u01/bsprod/rman/BSPROD_18.rman
  Control File Included: Ckp SCN: 2652427      Ckp time: 16-SEP-24

BS Key  Size       Device Type Elapsed Time Completion Time
------- ---------- ----------- ------------ ---------------
17      9.50K      DISK        00:00:00     16-SEP-24
        BP Key: 17   Status: AVAILABLE  Compressed: NO  Tag: TAG20240916T113750
        Piece Name: /u01/bsprod/rman/BSPROD_19.rman

  List of Archived Logs in backup set 17
  Thrd Seq     Low SCN    Low Time  Next SCN   Next Time
  ---- ------- ---------- --------- ---------- ---------
  1    138     2652398    16-SEP-24 2652434    16-SEP-24

BS Key  Size       Device Type Elapsed Time Completion Time
------- ---------- ----------- ------------ ---------------
18      77.26M     DISK        00:00:00     21-SEP-24
        BP Key: 18   Status: AVAILABLE  Compressed: NO  Tag: TAG20240921T111021
        Piece Name: /u01/bsprod/backup/hot/BSPROD_51.rman

  List of Archived Logs in backup set 18
  Thrd Seq     Low SCN    Low Time  Next SCN   Next Time
  ---- ------- ---------- --------- ---------- ---------
  1    8       1034837    10-SEP-24 1035686    10-SEP-24
  1    9       1035686    10-SEP-24 1035700    10-SEP-24
  1    10      1035700    10-SEP-24 1035714    10-SEP-24
  1    11      1035714    10-SEP-24 1035739    10-SEP-24
  1    12      1035739    10-SEP-24 1036058    10-SEP-24
  1    13      1036058    10-SEP-24 1036686    10-SEP-24
  1    14      1036686    10-SEP-24 1036703    10-SEP-24
  1    15      1036703    10-SEP-24 1061218    11-SEP-24
  1    134     2644752    16-SEP-24 2651391    16-SEP-24
  1    135     2651391    16-SEP-24 2651728    16-SEP-24
  1    136     2651728    16-SEP-24 2651773    16-SEP-24
  1    137     2651773    16-SEP-24 2652398    16-SEP-24
  1    138     2652398    16-SEP-24 2652434    16-SEP-24
  1    139     2652434    16-SEP-24 2654907    16-SEP-24
  1    140     2654907    16-SEP-24 2655107    16-SEP-24
  1    141     2655107    16-SEP-24 2655117    16-SEP-24
  1    142     2655117    16-SEP-24 2677651    16-SEP-24
  1    143     2677651    16-SEP-24 2698878    19-SEP-24
  1    144     2698878    19-SEP-24 2726820    19-SEP-24
  1    145     2726820    19-SEP-24 2759019    21-SEP-24
  1    146     2759019    21-SEP-24 2767399    21-SEP-24
  1    147     2767399    21-SEP-24 2768808    21-SEP-24

BS Key  Type LV Size       Device Type Elapsed Time Completion Time
------- ---- -- ---------- ----------- ------------ ---------------
19      Full    1.41G      DISK        00:00:00     21-SEP-24
        BP Key: 19   Status: AVAILABLE  Compressed: NO  Tag: TAG20240921T111028
        Piece Name: /u01/bsprod/backup/hot/BSPROD_52.rman
  List of Datafiles in backup set 19
  File LV Type Ckp SCN    Ckp Time  Abs Fuz SCN Sparse Name
  ---- -- ---- ---------- --------- ----------- ------ ----
  1       Full 2768826    21-SEP-24              NO    /u01/bsprod/oradata/bsprod/system01.dbf
  2       Full 2768826    21-SEP-24              NO    /u01/bsprod/oradata/bsprod/sysaux01.dbf
  3       Full 2768826    21-SEP-24              NO    /u01/bsprod/oradata/bsprod/undotbs01.dbf
  4       Full 2768826    21-SEP-24              NO    /u01/bsprod/oradata/bsprod/users01.dbf
  5       Full 2768826    21-SEP-24              NO    /u01/bsprod/oradata/bsprod/defdata01.dbf
  6       Full 2768826    21-SEP-24              NO    /u01/bsprod/oradata/bsprod/dudue01.dbf
  7       Full 2768826    21-SEP-24              NO    /u01/bsprod/oradata/bsprod/dudue02.dbf
  8       Full 2768826    21-SEP-24              NO    /u01/bsprod/oradata/bsprod/corn01.dbf
  9       Full 2768826    21-SEP-24              NO    /u01/bsprod/oradata/bsprod/corn03.dbf
  10      Full 2768826    21-SEP-24              NO    /u01/bsprod/oradata/bsprod/lens001.dbf
  11      Full 2768826    21-SEP-24              NO    /u01/bsprod/oradata/bsprod/ddb.dbf

BS Key  Type LV Size       Device Type Elapsed Time Completion Time
------- ---- -- ---------- ----------- ------------ ---------------
20      Full    9.81M      DISK        00:00:00     21-SEP-24
        BP Key: 20   Status: AVAILABLE  Compressed: NO  Tag: TAG20240921T111028
        Piece Name: /u01/bsprod/backup/hot/BSPROD_53.rman
  SPFILE Included: Modification time: 21-SEP-24
  SPFILE db_unique_name: BSPROD
  Control File Included: Ckp SCN: 2768863      Ckp time: 21-SEP-24

BS Key  Type LV Size       Device Type Elapsed Time Completion Time
------- ---- -- ---------- ----------- ------------ ---------------
21      Full    9.78M      DISK        00:00:00     21-SEP-24
        BP Key: 21   Status: AVAILABLE  Compressed: NO  Tag: TAG20240921T111028
        Piece Name: /u01/bsprod/backup/hot/BSPROD_54.rman
  Control File Included: Ckp SCN: 2768864      Ckp time: 21-SEP-24

BS Key  Size       Device Type Elapsed Time Completion Time
------- ---------- ----------- ------------ ---------------
22      10.00K     DISK        00:00:00     21-SEP-24
        BP Key: 22   Status: AVAILABLE  Compressed: NO  Tag: TAG20240921T111148
        Piece Name: /u01/bsprod/backup/hot/BSPROD_55.rman

  List of Archived Logs in backup set 22
  Thrd Seq     Low SCN    Low Time  Next SCN   Next Time
  ---- ------- ---------- --------- ---------- ---------
  1    148     2768808    21-SEP-24 2768875    21-SEP-24

RMAN> restore database;

Starting restore at 21-SEP-24
allocated channel: ORA_DISK_1
channel ORA_DISK_1: SID=390 device type=DISK

channel ORA_DISK_1: starting datafile backup set restore
channel ORA_DISK_1: specifying datafile(s) to restore from backup set
channel ORA_DISK_1: restoring datafile 00001 to /u01/bsprod/oradata/bsprod/system01.dbf
channel ORA_DISK_1: restoring datafile 00002 to /u01/bsprod/oradata/bsprod/sysaux01.dbf
channel ORA_DISK_1: restoring datafile 00003 to /u01/bsprod/oradata/bsprod/undotbs01.dbf
channel ORA_DISK_1: restoring datafile 00004 to /u01/bsprod/oradata/bsprod/users01.dbf
channel ORA_DISK_1: restoring datafile 00005 to /u01/bsprod/oradata/bsprod/defdata01.dbf
channel ORA_DISK_1: restoring datafile 00006 to /u01/bsprod/oradata/bsprod/dudue01.dbf
channel ORA_DISK_1: restoring datafile 00007 to /u01/bsprod/oradata/bsprod/dudue02.dbf
channel ORA_DISK_1: restoring datafile 00008 to /u01/bsprod/oradata/bsprod/corn01.dbf
channel ORA_DISK_1: restoring datafile 00009 to /u01/bsprod/oradata/bsprod/corn03.dbf
channel ORA_DISK_1: restoring datafile 00010 to /u01/bsprod/oradata/bsprod/lens001.dbf
channel ORA_DISK_1: restoring datafile 00011 to /u01/bsprod/oradata/bsprod/ddb.dbf
channel ORA_DISK_1: reading from backup piece /u01/bsprod/backup/hot/BSPROD_52.rman
channel ORA_DISK_1: piece handle=/u01/bsprod/backup/hot/BSPROD_52.rman tag=TAG20240921T111028
channel ORA_DISK_1: restored backup piece 1
channel ORA_DISK_1: restore complete, elapsed time: 00:00:55
Finished restore at 21-SEP-24

RMAN> recover database;

Starting recover at 21-SEP-24
using channel ORA_DISK_1

starting media recovery

channel ORA_DISK_1: starting archived log restore to default destination
channel ORA_DISK_1: restoring archived log
archived log thread=1 sequence=146
channel ORA_DISK_1: restoring archived log
archived log thread=1 sequence=147
channel ORA_DISK_1: reading from backup piece /u01/bsprod/backup/hot/BSPROD_51.rman
channel ORA_DISK_1: piece handle=/u01/bsprod/backup/hot/BSPROD_51.rman tag=TAG20240921T111021
channel ORA_DISK_1: restored backup piece 1
channel ORA_DISK_1: restore complete, elapsed time: 00:00:01
archived log file name=/u01/bsprod/arch/arch_1_146_1106935381.log thread=1 sequence=0
archived log file name=/u01/bsprod/arch/arch_1_147_1106935381.log thread=1 sequence=147
channel ORA_DISK_1: starting archived log restore to default destination
channel ORA_DISK_1: restoring archived log
archived log thread=1 sequence=148
channel ORA_DISK_1: reading from backup piece /u01/bsprod/backup/hot/BSPROD_55.rman
channel ORA_DISK_1: piece handle=/u01/bsprod/backup/hot/BSPROD_55.rman tag=TAG20240921T111148
channel ORA_DISK_1: restored backup piece 1
channel ORA_DISK_1: restore complete, elapsed time: 00:00:01
archived log file name=/u01/bsprod/arch/arch_1_148_1106935381.log thread=1 sequence=148
media recovery complete, elapsed time: 00:00:01
Finished recover at 21-SEP-24

RMAN> exit


Recovery Manager complete.
[oracle@srvr88 hot]$ sqlplus / as sysdba;

SQL*Plus: Release 19.0.0.0.0 - Production on Sat Sep 21 11:55:51 2024
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle.  All rights reserved.


Connected to:
Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0

SQL> shut immediate
ORA-01109: database not open


Database dismounted.
ORACLE instance shut down.
SQL> startup

ORACLE instance started.

Total System Global Area 1002437904 bytes
Fixed Size                  8903952 bytes
Variable Size             318767104 bytes
Database Buffers          671088640 bytes
Redo Buffers                3678208 bytes
Database mounted.
Database opened.
SQL> SQL>
SQL>
SQL>
SQL> select open_mode from v$database;

OPEN_MODE
--------------------
READ ONLY

SQL> exit
Disconnected from Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0
[oracle@srvr88 hot]$ sqlplus / as sysdba;

SQL*Plus: Release 19.0.0.0.0 - Production on Sat Sep 21 12:05:28 2024
Version 19.3.0.0.0

Copyright (c) 1982, 2019, Oracle.  All rights reserved.


Connected to:
Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0

SQL> select sequence#,applied from v$archived_log;

 SEQUENCE# APPLIED
---------- ---------
       147 YES
       146 YES
       148 YES

SQL> /

 SEQUENCE# APPLIED
---------- ---------
       147 YES
       146 YES
       148 YES
       149 NO

SQL> /

 SEQUENCE# APPLIED
---------- ---------
       147 YES
       146 YES
       148 YES
       149 NO
       150 NO
       151 NO
       152 NO

7 rows selected.

SQL> alter database add standby logfile
  2  group 4 'u01/bsprod/oradata/bsprod/stby04.log' size 50m,
  3  group 5 'u01/bsprod/oradata/bsprod/stby05.log' size 50m,
  4  group 6 'u01/bsprod/oradata/bsprod/stby06.log' size 50m,
  5  group 7 'u01/bsprod/oradata/bsprod/stby07.log' size 50m;
alter database add standby logfile
*
ERROR at line 1:
ORA-00301: error in adding log file 'u01/bsprod/oradata/bsprod/stby04.log' -
file cannot be created
ORA-27040: file create error, unable to create file
Linux-x86_64 Error: 2: No such file or directory
Additional information: 1


SQL> select member from v$logfile;

MEMBER
--------------------------------------------------------------------------------
/u01/app/oracle/product/19.3.0/db_home/dbs/broken2
/u01/app/oracle/product/19.3.0/db_home/dbs/broken1
/u01/app/oracle/product/19.3.0/db_home/dbs/broken0

SQL> ^C

SQL>
SQL> alter database add standby logfile
  2  group 4 '/u01/bsprod/oradata/bsprod/stby4.log' size 50m,
  3   group 5 '/u01/bsprod/oradata/bsprod/stby5.log' size 50m,
  4   group 6 '/u01/bsprod/oradata/bsprod/stby6.log' size 50m,
  5  group 7 '/u01/bsprod/oradata/bsprod/stby7.log' size 50m;  2    3    4    5
  2  group 4 '/u01/bsprod/oradata/bsprod/stby4.log' size 50m,
  *
ERROR at line 2:
ORA-02236: invalid file name


SQL> alter database add standby logfile
  2
SQL> alter database add standby logfile
  2  group 4 '/u01/app/oracle/product/19.3.0/db_home/dbs/stby04.log' size 50m,
  3  group 5 '/u01/app/oracle/product/19.3.0/db_home/dbs/stby05.log' size 50m,
  4  group 6 '/u01/app/oracle/product/19.3.0/db_home/dbs/stby06.log' size 50m,
  5  group 7 '/u01/app/oracle/product/19.3.0/db_home/dbs/stby07.log' size 50m;

Database altered.

SQL>
SQL>
SQL>
SQL>
SQL> recover standby database using current logfile disconnect;
ORA-01906: BACKUP keyword expected


SQL> recover managed standby database using current logfile disconnect;
Media recovery complete.
SQL> select sequence#, status from v$log;

 SEQUENCE# STATUS
---------- ----------------
       145 INACTIVE
       146 CURRENT
       144 INACTIVE

SQL> set process,status,sequence# from v$managed_standby;
SP2-0735: unknown SET option beginning "process,st..."
SQL> select  process,status,sequence# from v$managed_standby;

PROCESS   STATUS        SEQUENCE#
--------- ------------ ----------
ARCH      CLOSING             157
DGRD      ALLOCATED             0
DGRD      ALLOCATED             0
ARCH      CLOSING             154
ARCH      CLOSING             155
ARCH      CLOSING             156
RFS       IDLE                  0
RFS       IDLE                  0
RFS       IDLE                  0
RFS       IDLE                158
MRP0      APPLYING_LOG        158

11 rows selected.

SQL> select  process,status,sequence# from v$managed_standby;

PROCESS   STATUS        SEQUENCE#
--------- ------------ ----------
ARCH      CLOSING             157
DGRD      ALLOCATED             0
DGRD      ALLOCATED             0
ARCH      CLOSING             160
ARCH      CLOSING             158
ARCH      CLOSING             161
RFS       IDLE                  0
RFS       IDLE                  0
RFS       IDLE                  0
RFS       IDLE                162
MRP0      APPLYING_LOG        162

11 rows selected.

SQL> select name from v$tab
  2  ;
select name from v$tab
                 *
ERROR at line 1:
ORA-00942: table or view does not exist


SQL> select name from v$tablespace;

NAME
------------------------------
SYSTEM
SYSAUX
UNDOTBS1
USERS
TEMP
ROME
DUKE
CORN
LENS

9 rows selected.

SQL> select name from v$tablespace;

NAME
------------------------------
SYSTEM
SYSAUX
UNDOTBS1
USERS
TEMP
ROME
DUKE
CORN
LENS
CAKE

10 rows selected.

SQL> exit
Disconnected from Oracle Database 19c Enterprise Edition Release 19.0.0.0.0 - Production
Version 19.3.0.0.0
[oracle@srvr88 hot]$
