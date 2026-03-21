# iris-sys-recs-2026
## Round 2-Task 4 (Automated Backup System)

### Creating the backup.sh script:
* Made 2 directories. Backups is the directiry inside the container and nfs-dir for taking data from the nfs volume. Declared DB-HOST as MYSQL because container is on application network, so it should be able to reach it.
* Docker containers immediatelyt exit idf they don't have a foregroiund process. So did the backup inside an infinite loop so container stays alive forever.
* Took timestamps using ```TIMESTAMP=$(date +"%Y%m%d_%H%M%S")``` to store timestamped backups.
* Took backups using mysqldump and tar. mysqldump exports the database into a text file and tar compresses the entire nfs directory into a .tar.gz file.
* In the loop for removing files, we use ```-t``` to sort the files by newest first, then we use ```sed -e '1,5d'```, so the stream editor removes the first 5 backup files . Rest of the older files are deleted.


### Editing inside docker compose file:
* The backup service addition. Used alpine linux(lighweigth and fast) and put it in ```networks:application``` to keep it on same network as the mysql container. Made the dependency as mysql and nfs_server so the backup service doesn't start before the mysql or the nfs_server container.
* Added 3 volumes. ```./backup.sh:/backup.sh:ro``` mounts the script file from host onto container only in read-only mode. ```nfs_share:/nfsshare:ro``` mounted the nfs docker volume into backup container in read-only mode. ```./backups:/backups``` basically mapping a folder on the host into the container.
* Added the runtime command. Made script executable using ```chmod +x``` and then executed it using ```/bacup.sh```.
  
