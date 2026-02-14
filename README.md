# iris-sys-recs-2026
## Task-3

### Updating the Docker Compose
* Removed the port mapping according to instructions of task.
* Added nginx service, using ```nginx:latest``` image.
* Exposed port 80 as mentioned.
* Added path to dafult.conf which is the configuration file for the nginx to act as a reverse proxy to the web application.
* Made it depend on web so that it loads only after the wes server.

### The Nginx Config File
* Defined a group of servers named ```rails_cluster``` which point to the container web on port 3000.
* Defined the server block to listen on port 8.
* Added ```proxy_pass``` which takes incoming requests and forwards it to the rails cluster.
* Added the ```proxy_set_header``` directives to tell the ruby app requests are coming from the IP of the real user and not nginx's internal IP.
  

