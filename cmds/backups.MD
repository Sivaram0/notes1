COLD_BACKUPS ::

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

database mount state
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