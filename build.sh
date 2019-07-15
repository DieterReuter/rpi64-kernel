#!/bin/bash
set -e

export DEFCONFIG=docker_kvm_rpi3_defconfig
docker-compose -p rpikernelbuild build
docker-compose -p rpikernelbuild run builder
docker-compose -p rpikernelbuild down
