# build the docker image and tag it 'personal-website'
docker build -t investmentswise-webapp .
# run the image tagged personal-website we just built, with the container's port 8080 bound to the host's port 80
sudo docker run -it -p 80:8080 investmentswise-webapp
