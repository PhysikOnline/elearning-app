# Set-up
Set up Docker, it is described here: https://www.docker.com/get-docker.
Do NOT use Docker Toolbox.
After installed Docker, you launch it an login (if you have not an account yet, this is a good opportunity to create one)
Then get in the Docker settings -> Deamon -> (change configuration option von Basic to Advanced) and add the line ```"storage-driver": "aufs"``` it should look like this:
```
{
  "registry-mirrors": [],
  "insecure-registries": [],
  "debug": true,
  "experimental": false,
  "storage-driver": "aufs"
}
```

You probably need to enable virtualization in you BIOS.

AND YOURE DONE! Pretty fast, wasn't it?

# Build and run the container
for building use:
```
docker-compose up
```

# Installing node dependencies
For installing node dependencies you use:
```
docker-compose run --rm app /bin/bash
```
for entereing the console in the docker container. There you can install packages by running
```
npm install --save <your-package>
```
<!-- for building use:
```
docker build -t app .
```
do not forget the `.`. to run the image use:
```
docker run app
```
if you want to run docker and exit in the ubuntu shell, this can be done with the command:
```
docker run -it app bash
```
-->
# Section for ERRORS
1. When a Dockerfile is build, the images are partially stored an reused. This __could__ lead to some problems. A intuitive way is to rebuild the whole image. For this execute:
```
# Delete all containers
docker rm $(docker ps -a -q)
# Delete all images
docker rmi $(docker images -q)
```
you can check if all images are deleted by running `docker ps -a` which lists all images.

2. the next step ist to restart docker by right-klicking the docker icon in your taskbar and smash __restart__.
<!--
# How to update
## Meteor
Meteor can be updated bei replacing in the Dockerfile the `<version>` with the version you want to use.
```
RUN curl https://install.meteor.com/?release=<version> | sed s/--progress-bar/-sL/g | /bin/sh
```
```
RUN cp "/home/meteor/.meteor/packages/meteor-tool/1.7.0_1/mt-os.linux.x86_64/scripts/admin/launch-meteor" /usr/bin/meteor
```
-->