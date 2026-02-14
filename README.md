# iris-sys-recs-2026
## Task-6

### Updating the Docker Compose File
* Instead of explicitly defining 3 web services inside my ```docker-compose.yml```, defined only 1 web service.
  
### Updating default.conf
* Kept only 1 web service in my rails-cluster.

#### Brought up everything using command ```docker compose up -d --scale web=3```. This creates 3 containers of the web service without having to explicitly define them inside our compose file. This bringus up all the 3 containers with a single command.

![scre4](/public/sc4.png)
