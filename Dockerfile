# Dockerfile

# Tell docker what base image to use
FROM node:7.9.0-alpine

# Copy package.json over to the docker container and install packages using npm install
# We copy this here instead of on a later line in order to leverage Docker's caching.
# Caching this is beyond the scope of this post, but you can read more http://bitjudo.com/blog/2014/03/13/building-efficient-dockerfiles-node-dot-js/
COPY ./package.json /packages/package.json
RUN cd /packages/ && npm install -q

# We'll now use /personal_website as our path to run all subsequent commands
WORKDIR /investmentswise-webapp

# Copy over the npm packages (http-server) to this folder
RUN cp -a /packages/* /investmentswise-webapp/
# Copy all other contents from the host to the docker container
COPY . /investmentswise-webapp

# Expose the port we're serving our website on
EXPOSE 8080

# All steps above this run at build time. The step below tells docker what to do when the container is being run.
CMD ["node_modules/.bin/http-server", "public", "-p 8080"]
