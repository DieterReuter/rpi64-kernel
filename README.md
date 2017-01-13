
# Build a Linux kernel for Raspberry Pi 3 in 64bit


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
$ ls -al ./builds/20170113-171000/
-rw-r--r--   1 dieter  staff  18134989 Jan 13 18:36 4.9.2-bee42-v8.tar.bz2
drwxr-xr-x   5 dieter  staff       170 Jan 13 18:36 boot
-rw-r--r--   1 dieter  staff    140067 Jan 13 18:10 config-4.9.2-bee42-v8
```


---
The MIT License (MIT)

Copyright (c) 2016 Dieter Reuter
