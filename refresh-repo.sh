#!/bin/bash

if [ -d $LINUX ]; then
  # update kernel repo
  cd $LINUX
  CURRENT_BRANCH=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
  CURRENT_ORIGIN=$(git remote -v | grep origin | grep fetch | sed -n -e 's/^origin\s\(.*\)\s(fetch)/\1/p')
  if [ "$CURRENT_BRANCH" == "$RPI_KERNEL_BRANCH" ] && [ "$CURRENT_ORIGIN" == "$RPI_KERNEL_REPO" ]; then
      git pull
      git checkout $RPI_KERNEL_BRANCH
  else
      cd ..
      rm -rf $LINUX
      mkdir -p $LINUX
      git clone --single-branch --branch $RPI_KERNEL_BRANCH --depth 1 $RPI_KERNEL_REPO $LINUX
  fi
else
  # clone kernel repo
  git clone --single-branch --branch $RPI_KERNEL_BRANCH --depth 1 $RPI_KERNEL_REPO $LINUX
fi
