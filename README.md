# iris-sys-recs-2026
## Round 2-Task 4 (Automated Backup System)

### Creating the backup.sh script:
* 


### Editing inside docker compose file:
* The backup service addition. Used alpine linux(lighweigth and fast) and put it in ```networks:application``` to keep it on same network as the mysql container. Made the dependency as mysql and nfs_server so the backup service doesn't start before the mysql or the nfs_server container.
* Added 3 volumes. ```./backup.sh:/backup.sh:ro``` mounts the script file from host onto container only in read-only mode. ```nfs_share:/nfsshare:ro``` mounted the nfs docker volume into backup container in read-onmly mode. ```./backups:/backups``` basically mapping a folder on the host into the container. 
  
