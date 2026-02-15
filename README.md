# iris-sys-recs-2026
## Task-8

### Modifying the Gemfile
* Added ```gem 'yabeda-rails'``` and ```gem 'yabeda-prometheus'```. yabeda-rails automatically generates the metrics and yabeda-prometheus provides the endpoint from where prometheus can scrape the data.
  
### Modifying routes.rb 
* Added ```mount Yabeda::Prometheus::Exporter => "/metrics"``` line. It tells rails to create a web page for prometheus at the app's address ending in metrics.
* It also links the ```yabeda-prometheus``` url to that link.
  
### Modifying development.rb
* Rails has a security feature in development mode that allows only app access if it is on localhost.
* To use prometheus we have to bypass that, hence added the line ```config.hosts.clear``` which prevents rails from blocking the request.

### Modifying docker-compose.yml
* Added the service for prometheus.
* Built it on the image ```prom/prometheus:latest```
* Exposed it on port 9090.
* Added volume for persistence.
* Used ```'--config.file=/etc/prometheus/prometheus.yml'``` as command, to tell prometheus where to look for it's configuration.
* Added dependency as web so that prometheus would only run after rails app is launched.

### Adding the prometheus-config.yml
#### Located in config subdirectory
* Gave the target as ```web:3000```, web being the rail app's name and the port 3000 where it is exposed.
* Set scrape interval as 4s.

### Further Steps

* Ran the compose file and then pulled the image for grafana and ran it using command ```docker run -d -p 3000:3000 --name=grafana grafana/grafana-oss```.
  ![screen8](/public/sc8.png)

* The prometheus website I could access on port 9090.
  ![screen5](/public/sc5.png)
  
* Entered the grafana website on port 3000 using username and password as admin.
* Used standard Yabeda Rails desktop interface for visualising the metrics.
* Refreshed the IRIS Share page for the requests.

  ![screen6](/public/sc6.png)

#### This was the final Grafana metrics page I got.



