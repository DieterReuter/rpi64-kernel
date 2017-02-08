#!/bin/bash
set -e
set -x

# see: https://docs.travis-ci.com/user/triggering-builds

# prepare data for triggering Travis-CI
TOKEN=xxx
REPO='DieterReuter%2Frpi64-kernel'
BODY='{
"request": {
  "branch":"master",
  "message": "Build triggered by Dieter via API"
}}'

curl -s -X POST \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -H "Travis-API-Version: 3" \
  -H "Authorization: token $TOKEN" \
  -d "$BODY" \
  https://api.travis-ci.com/repo/$REPO/requests
