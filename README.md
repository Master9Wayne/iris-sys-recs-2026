# iris-sys-recs-2026
## Round 2-Task 3 (Monitoring Stack)

### Editing the docker-compose file:
* Added 3 services for cadvisor, node-exporter and nginx-exporter. cadvisor scrapes data from all the containers automatically. Exposaed it on the monitoring network without exposing any ports. Node-exporter pulls hardware and os-level metrics. Nginx-exporter converts nginx stats to make it prometheus scrapable.
* Ensured no ports were exposed anywhere.

### Editing the nginx config file:
* Created a new server block for prometheus. I added ```proxy_pass http://prometheus:9090``` to securely forward traffic from NGINX to prometheus container.
* Used ```.htpasswd``` for security.
* Similarly there is a block which protects it with http basic auth and securely forwards traffic from NGINX to the isolated grafana container.

### Editing the prometheus config file:
* Added jobs for scraping data from cadvisor, node-exporter, rails-app and nginx-exporter.
* Dynamic scarping cause there are 3 replicas of the web service. Added ```dns_sd_configs``` pointing to the web service name. Prometheus automatically finds all the 3 replicas.

![screen8](/public/sc18.png)
Prometheus is scraping data from all the containers properly.

![screen8](/public/sc17.png)
Grafana dashboard for CPU and Memory Usage.
  
  
