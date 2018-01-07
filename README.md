
# Build a Linux kernel for Raspberry Pi 3 in 64bit
[![Build Status](https://travis-ci.org/DieterReuter/rpi64-kernel.svg?branch=master)](https://travis-ci.org/DieterReuter/rpi64-kernel)

This repo just builds a Linux kernel for Raspberry Pi 3 in 64bit. It uses the linux kernel provided by the upstream repo at https://github.com/raspberrypi/linux.

Latest LTS Linux Kernel now is 4.9.73.


## Prerequisites
In order to build the latest Linux kernel 4.9.x for the Raspberry Pi 3 board you only need a few tools on your Mac:

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
$ tree builds
builds
└── 20170303-152804
    ├── 4.9.13-bee42-v8.config
    ├── 4.9.13-bee42-v8.tar.gz
    ├── 4.9.13-bee42-v8.tar.gz.sha256
    ├── bootfiles.tar.gz
    └── bootfiles.tar.gz.sha256

1 directory, 5 files
```

```
$ ls -al ./builds/20170303-152804/
-rw-r--r--  1 dieter  staff    140641 Mar  3 16:28 4.9.13-bee42-v8.config
-rw-r--r--  1 dieter  staff  21863866 Mar  3 16:40 4.9.13-bee42-v8.tar.gz
-rw-r--r--  1 dieter  staff        89 Mar  3 16:40 4.9.13-bee42-v8.tar.gz.sha256
-rw-r--r--  1 dieter  staff   5092332 Mar  3 16:40 bootfiles.tar.gz
-rw-r--r--  1 dieter  staff        83 Mar  3 16:40 bootfiles.tar.gz.sha256
```


---
The MIT License (MIT)

Copyright (c) 2017 Dieter Reuter
