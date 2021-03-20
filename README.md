![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/noctuary/adminer-mysql/latest?style=plastic)    ![Image size](https://img.shields.io/docker/image-size/noctuary/adminer-mysql/latest?style=plastic)    ![Docker Pulls](https://img.shields.io/docker/pulls/noctuary/adminer-mysql?style=plastic)  

Docker Hub: [noctuary/adminer-mysql](https://hub.docker.com/repository/docker/noctuary/phpmyadmin)   

## A tiny Adminer for MySQL image

The compressed image size is 6 MB.  
Once pulled, it will take 16 MB of disk space. 

It is 5 times smaller than the [Docker Official Adminer images](https://hub.docker.com/_/adminer).  

### Why is it so small?

Adminer for MySQL itself is very small: 356 KB.  
Runs in Alpine Linux.  
Default design (theme) only.  
No extra web server: use the PHP built in web server.  

### Usage
```
docker run --rm -p 8080:8080 noctuary/adminer-mysql
```
then CTRL+C to exit the container
