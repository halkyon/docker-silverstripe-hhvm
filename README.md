# docker-silverstripe-hhvm

## Introduction

Source to build a docker container suitable for running a PHP framework like SilverStripe.

This was created specifically for running SilverStripe sites, but could be easily modified to run any PHP framework.

Base image is Ubuntu 14.04 LTS "trusty". Additional software installed:

 * wget
 * curl
 * supervisor
 * nginx 1.4.6
 * HHVM (nightly)
 * MariaDB 5.5.37
 * composer

All are installed to the latest package Ubuntu provides, except for HHVM which is currently
using the nightly builds. Once HHVM 3.3 stable is released, this will be switched over to
the stable package.

## Usage

### Building

	docker build -t docker-ss-hhvm .

### Running

The following command will mount your SilverStripe site onto the container as /var/www/, and forward port 80
to port 8000 on the host. You can access the site via http://localhost:8000

	docker run -d -p 8000:80 -v /path/to/site:/var/www docker-ss-hhvm

### With Vagrant

Vagrant can be used for cases where the host cannot run docker. This is especially useful for those on Mac OS X,
for example.

The following command will create (or re-use) a docker host VM which will host the docker container, and forward
port 80 to port 8000 on the VM, then onto port 8000 on the host machine. You can access the site via http://localhost:8000

	WEB_FORWARDED_PORT=8000 WEBROOT_PATH=/path/to/site vagrant up --provider="docker"

`WEB_FORWARDED_PORT` is the port to forward port 80 to the docker host VM, and then to the host machine. Default is 8000.

`WEBROOT_PATH` refers to a path on the host machine containing a site you want to mount as the webroot on the container.
This will then be mounted on the host VM and exposed to the docker container as a mounted volume.

If you're doing anything with multiple containers, you'll probably want to heavily customise the `Vagrantfile` to
support that, as the provided configuration is only really useful in the context of a single container.

