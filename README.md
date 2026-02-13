# iris-sys-recs-2026
## Task-1
### Gemfile Modifications
* Changed the Gemfile due to a version mismatch. It used Rails version 8.1 for functionality such as activesupport but the main Rails gem was using version 7.0.
Removed the activesupport and activerecord lines to resolve the correct version of 7.

### Adding the Dockerfile
* Initialized the build using ```ruby:3.4.1``` image.
* Used run command to update the package manager and install nodejs, mysql header files and package for compiling Ruby Gems.
* Created a directory and copied the Gemfile and Gemfile.lock files into container for faster builds. Then ```RUN bundle install``` to download the gemfiles.
* Copied the rest of the application code, used the helper script entrypoint.sh and made it executable using ```RUN chmod +x /usr/bin/entrypoint.sh```. Then set the entrypoint to the container as this script.
* Set the environment variable to Production, exposed port 3000 and CMD command to launch the PUMA web server.
