#!/bin/bash
set -e

docker-compose build
docker-compose run builder
