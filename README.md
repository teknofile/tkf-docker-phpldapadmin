[![Codacy Badge](https://api.codacy.com/project/badge/Grade/ed96c1467a4344729346d669297e3d11)](https://www.codacy.com/app/teknofile/tkf-docker-phpldapadmin?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=teknofile/tkf-docker-phpldapadmin&amp;utm_campaign=Badge_Grade)

# tkf-docker-phpldapadmin

This container is meant to make it easy to run a phpLDAPadmin system. This container is built off of a somehwat old lsiobase alpine 3.5 image. This is due to incompatibilities of newer PHP 7.x systems. 

Like most LSIO containers, state is saved into the /config directory. Once initially created, you can modify and restart the container as needed. In fact, you'll need to at least install the config.php file in /config/www/config.php. Inside the containers webroot, this is a symlink to where it really should be.

This image is based off of the [LinuxServer.io](https://github.com/linuxserver/) teams' [lsiobase-alpine image](https://hub.docker.com/r/lsiobase/alpine) and as such is a really small image. 

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

This image is still in testing. I have released v0.1.0, as a beta quality release. Please use at your own risk. I take no responsibility for anything that may go wrong or right for you. 

To get started, [download the code](https://github.com/teknofile/tkf-docker-phpldapadmin/releases/tag/v0.1.0), build the container and run it. See below for an example method I use for building the container.

### Prerequisites
Really all that should be needed is a recent version of Docker (I have been testing with Docker version 18.09.6).

### Installing
A step by step series of examples that tell you how to get a development env running. 
Download the code and all
```
git clone https://github.com/teknofile/tkf-docker-phpldapadmin
```

Build the docker container. 
Assumptions are that you are not exposing any HTTP/HTTPS ports directly. My recommendation is to use the LSIO letsencrypt container, and put into the 'your-docker-net' network below and proxy all of the traffic through it to this container. You don't have to do it that way, but that's what I would do.

```
  docker create \
    --name=my-contianer \
    -e PUID=$(id -u) \
    -e PGID=$(id -g) \
    -e TZ=US/Mountain \
    --network your-docker-net \
    -v /path/to/localconfigdir:/config \
    --restart unless-stopped \
    --detach teknofile/tkf-docker-phpldapadmin:latest
```

Start the container
```
docker start my-container
```

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We (will) use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags).

## Authors

*  **teknofile** - *Initial work* - [teknofile](https://teknofile.org/)

See also the list of [contributors](https://github.com/teknofile/tkf-docker-phpldapadmin/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/teknofile/tkf-docker-phpldapadmin/blob/master/LICENSE) file for details

## Acknowledgments

*  TBD
