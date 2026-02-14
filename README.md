# iris-sys-recs-2026
## Task-7

### Updating default.conf file

#### Defining the Limit
* Added ```limit_req_zone $binary_remote_addr zone=ip_limit:10m rate=7r/s``` line.
* ```limit_req_zone``` is the directive to define a shared memory zone for limiting request rates.
* ```$binary_remote_addr``` to tell nginx to track users by their IP addresses.
* ```zone=ip_limit:10m``` creates zoen for tracking the IPs. Allocates 10MB of memory for the zone.
* ```rate=7r/s``` means it allows only 7 requests per second.
#### Applying the Limit
* Added ```limit_req zone=ip_limit burst=15 nodelay``` line.
* ```limit_req zone=ip_limit``` activates the limit.
* ```burst=15``` allows a client to temporarily exceed the rate limit by up to 15 requests.
* ```nodelay``` instructs nginx to process the burst requests immediately.
