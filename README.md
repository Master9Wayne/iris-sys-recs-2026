# iris-sys-recs-2026
## Task-2
### Docker Compose File for Database

#### Default Section

* Created a database.yml in /config subdirectory.
* Used ```adapter: mysql2``` to tell the rails app to connect with mysql dataase.
* Set the encoding to ```utf8mb4``` .
* Set the connection pool, size using ```pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>``` which tries to read RAILS_MAX_THREADS otherwise defaults to 5.
* Defined ```host: mysql``` to allow the Rails application to resolve the database container's IP address using Docker's internal DNS.
* Hardcoded the username and password.
* Used port 3306, which is standard for MySQL.
 
#### Development Section
* Helps connect to the Rails app and initializes a database named app_db.

### Compose file for Connecting Rails App and Database

#### MySQL Service
* Used the ```mysql: 8.0``` image.
* Configures environment variables to initialize database.
* Does not expose port 3306 of the mysql container ensuring database is accessible only internally.

#### Web Service
* Builds image from Dockerfile in current directory.
* Maps port 8080 to 3000 to make the application accessible at localhost:8080.
* Added dependency as mysql to ensure application starts only after database service.
* Added ```RAILS_SERVE_STATIC_FILES: "true"```. Was getting error before because CSS/ JS assets were not loading in the container.
* Then passed the database credentials.
