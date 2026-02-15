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

### Adding the prometheus-config.yml
#### Located in config subdirectory
* Gave the target as ```web:3000```, web being the rail app's name and the port 3000 where it is exposed.
* Set scrape interval as 4s.


