# iris-sys-recs-2026
## Round 2- Task 2 (Shared Storage via NFS)

### The NFS Server
* Used an Alpine Based NFS-Server image for container to be lightweight and fast. It runs on the isolated storage network.
* All 3 web replica containers use it, so as soon as a file becomes available to 1 replica it becomes available to all the others as well.
* The NFS Server data is backed up by a local Docker volume ```nfs_data```. So, the data survives even if the NFS container is stopped or restarted.
 ![screen8](/public/sc13.png)
The NFS Server service inside docker compose file.
![screen8](/public/sc13.png)
The volume for it's persistence.

  
  
