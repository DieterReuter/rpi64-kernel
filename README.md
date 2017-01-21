
# Build a Linux kernel for Raspberry Pi 3 in 64bit
[![Build Status](https://travis-ci.com/DieterReuter/rpi64-kernel.svg?token=ExPqNxiRaVAPsjieDH9T&branch=master)](https://travis-ci.com/DieterReuter/rpi64-kernel)


## Prerequisites
In order to build the LK 4.9 for the Raspberry Pi 3 board you only need a few tools on your Mac:

1. git
2. [Docker for Mac](https://docs.docker.com/docker-for-mac/)


## Step 1: Clone the repo
```
$ git clone https://github.com/DieterReuter/rpi64-kernel/
$ cd rpi64-kernel
```


## Step 2: Build the kernel
To build the Linux kernel you only have to invoke a single command. All the required building steps will be run automatically by the Docker tools inside of an isolated environment.
```
$ docker-compose build
$ docker-compose run builder
```

That's all !!!


## Build results
The build artifacts can be found on a local directory `./builds`.
```
ls -al ./builds/20170121-114222/
total 52624
-rw-r--r--   1 dieter  staff    140189 Jan 21 12:42 4.9.4-bee42-v8.config
-rw-r--r--   1 dieter  staff  21790694 Jan 21 12:53 4.9.4-bee42-v8.tar.gz
-rw-r--r--   1 dieter  staff        88 Jan 21 12:53 4.9.4-bee42-v8.tar.gz.sha256
-rw-r--r--   1 dieter  staff   5000051 Jan 21 12:53 bootfiles.tar.gz
-rw-r--r--   1 dieter  staff        83 Jan 21 12:53 bootfiles.tar.gz.sha256
```


---
The MIT License (MIT)

Copyright (c) 2016 Dieter Reuter
