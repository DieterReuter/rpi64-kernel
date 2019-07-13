
# Build a Linux kernel for Raspberry Pi 3 in 64bit
[![Build Status](https://travis-ci.org/DieterReuter/rpi64-kernel.svg?branch=master)](https://travis-ci.org/DieterReuter/rpi64-kernel)

This repo just builds a Linux kernel for Raspberry Pi 3 in 64bit. It uses the linux kernel provided by the upstream repo at https://github.com/raspberrypi/linux.

Latest LTS Linux Kernel now is  4.19.58.


## Prerequisites
In order to build the latest Linux kernel 4.19.x for the Raspberry Pi 3 board you only need a few tools on your Mac:

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
$ tree builds/
builds/
└── 20190713-120238
    ├── 4.19.58-hypriotos-v8.config
    ├── 4.19.58-hypriotos-v8.tar.gz
    ├── 4.19.58-hypriotos-v8.tar.gz.sha256
    ├── bootfiles.tar.gz
    └── bootfiles.tar.gz.sha256

1 directory, 5 files
```

```
$ ls -al builds/20190713-120238/
total 57248
drwxr-xr-x  7 dieter  staff       224 Jul 13 14:16 .
drwxr-xr-x  3 dieter  staff        96 Jul 13 14:02 ..
-rw-r--r--  1 dieter  staff    152760 Jul 13 14:02 4.19.58-hypriotos-v8.config
-rw-r--r--  1 dieter  staff  23432099 Jul 13 14:16 4.19.58-hypriotos-v8.tar.gz
-rw-r--r--  1 dieter  staff        94 Jul 13 14:16 4.19.58-hypriotos-v8.tar.gz.sha256
-rw-r--r--  1 dieter  staff   5711955 Jul 13 14:16 bootfiles.tar.gz
-rw-r--r--  1 dieter  staff        83 Jul 13 14:16 bootfiles.tar.gz.sha256
```


## License

The MIT License (MIT)

Copyright (c) 2017-2019 Dieter Reuter
