#!/bin/bash
set -e

export DEFCONFIG=docker_rpi3_defconfig
docker-compose build
docker-compose run builder
docker-compose down
