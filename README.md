== README

Documentation here.
https://www.youtube.com/watch?v=4W2YY-qBla0

== TODO

- zip deploy code to s3
- example code
    // FROM ubuntu:12.04
    // RUN apt-get update
    // RUN apt-get install -y nginx zip curl
    // RUN echo "daemon off;" >> /etc/nginx/nginx.conf
    // RUN curl -o /usr/share/nginx/www/master.zip -L https://codeload.github.com/gabrielecirulli/2048/zip/master
    // RUN cd /usr/share/nginx/www/ && unzip master.zip && mv 2048-master/* . && rm -rf 2048-master master.zip
    // EXPOSE 80
    // CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]

- setup ebs with nginx and rails is not working

- try docker commit
  docker commit -a "Adit Saxena <a.saxena.email@gmail.com>" -m "my msg here" container-id my-user/image-name

- Try these
  # Interactive shell:
  docker run -t -i docker-image-name /bin/bash
  # Port mapping
  docker run -d --name="new-container-name" -p=3000:80 my-user/image-name [passenger-start-command]

- deploy:
  https://github.com/docker/docker-registry
  http://blog.docker.com/2013/07/how-to-use-your-own-registry/

== CONVENTION

Dockerfile
docker-build.sh # create a container out of an image: docker build --tag=testapp .
docker-run.sh # fancy line of code to load an image: docker run -i -p 80:80 testapp
docker-startup.sh # RUN /bin/shell /startup/docker-startup.sh
docker-teardown.sh # destroy unused images


== PRIVATE DOCKER REGISTRY
    SETTINGS_FLAVOR=prod DOCKER_REGISTRY_CONFIG=/etc/docker/config.yml gunicorn -k gevent -b localhost:5000 --max-requests 100 --graceful-timeout 3600 -t 3600 -w 8 wsgi:application

    ssh -N -L 5000:localhost:5000 user@server

    docker login
    # Creates ~/.dockerconfig
    # {"https://index.docker.io/v1/":{"auth":"XXXXXXXXXXXXXYYYYY”==","email":"sysadmin@flux7.com"}}

== SUPERVISE PROCESSES
    https://www.digitalocean.com/community/tutorials/how-to-install-and-manage-supervisor-on-ubuntu-and-debian-vps

ANSWERED

- how to send my images to ec2? (beanstalk/cloud formation)
  Too huge image file, takes too much space (1GB)


