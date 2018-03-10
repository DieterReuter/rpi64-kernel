#!/bin/bash

/refresh-repo.sh >/dev/null 2>/dev/null

VERSION=$(grep "^VERSION = " $LINUX/Makefile | sed -n -e 's/^VERSION\s=\s\(.*\)/\1/p')
PATCH_LEVEL=$(grep "^PATCHLEVEL = " $LINUX/Makefile | sed -n -e 's/^PATCHLEVEL\s=\s\(.*\)/\1/p')
SUB_LEVEL=$(grep "^SUBLEVEL = " $LINUX/Makefile | sed -n -e 's/^SUBLEVEL\s=\s\(.*\)/\1/p')
EXTRA_VERSION=$(grep "^EXTRAVERSION = " $LINUX/Makefile | sed -n -e 's/^EXTRAVERSION\s=\s\(.*\)/\1/p')

OUTPUT_VERSION=$VERSION

if [ ! -z "$PATCH_LEVEL" ]; then
  OUTPUT_VERSION="${OUTPUT_VERSION}.${PATCH_LEVEL}"
fi

if [ ! -z "$SUB_LEVEL" ]; then
  OUTPUT_VERSION="${OUTPUT_VERSION}.${SUB_LEVEL}"
fi

if [ ! -z "$EXTRA_VERSION" ]; then
  OUTPUT_VERSION="${OUTPUT_VERSION}${EXTRA_VERSION}"
fi

echo $OUTPUT_VERSION
