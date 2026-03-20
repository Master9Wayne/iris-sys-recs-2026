# iris-sys-recs-2026
## Round 2- Task 1 ( Reverse Proxy, Load Balancing and Access Control)

### Initial Setup:
* Nginx exposed to only ports 80 and 443 as specified.
* Principle of Least Privilege: Principle by which only minimum permissions necessary to perform a task are provided. Created 4 networks Public, Application, Storage and Monitoring. All these networks were bridge networks with ```internal: true``` to provide maximum isolation so that containers over the same network can communicate, but cannot access external networks. Thie network definition was added in docker-compose file.
* Multi Network Attachment: Attached NGINX to both public and application networks to receive external traffic on the public network and forward it on the application network.

### Task Demands:
* Load Balancing: Used NGINX's default Round Robin Scheduling. Put parameters ```max_fails=3``` and ```fail_timeout=30s```, so that a server can fail a maximum of 3 times and created the time window for counting failures/time servewr stays disabled. This helps in automatic failover.
* Graceful Reloads: Used NGINX's native signal handling via docker exec command.
* Rate Limiting: Put ```limit_red_zone=7``` which only allows 7 requests/second with a burst of 15. Configured it to return 429 if limit is exceeded.
* Protecting grafana.localhost: Used .htpasswd to secure grafana.localhost via HTTP Basic AUTH to protect the internal services being used.
 ![screen8](/public/sc9.png)

### Testing:
* Used ```curl -H "Host: app.localhost" http://localhost``` to test subdomain routing and load balancing. The HTTP 200 OK response shows that eveyrthing is working.
![screen8](/public/sc10.png)

* Used ```for i in {1..100}; do curl -s -o /dev/null -w "%{http_code}\n" -H "Host: app.localhost" http://localhost; done``` to test limiting rate. After a few requests we start getting 429 which means limit has exceeded.
![screen8](/public/sc11.png)
  
  
