# iris-sys-recs-2026
## Task-4

### Updating the Docker Compose 
* Just added 2 more web services inside the compose file so that each service gts its own container and nginx can identify them.
* All of them connect to the same mysql container.
* Now the nginx service depends on web1, web2 and web3 so it launches only after entire cluster is up and running.

### Updating the default.conf
* Now in the rails cluster instead of having 1 web service, 3 have been defined.
* Now nginx will default to round robin for scheduling the load to each of these services, essentially acting as a load balancer.
  

In the given screenshot it is visible that all 3 containers of the web service, mysql and nginx are up and running.

![scre3](/public/sc3.png)
