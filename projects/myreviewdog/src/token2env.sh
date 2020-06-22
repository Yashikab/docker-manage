#!/bin/sh
python /src/get_token.py
cat /src/token.conf
export REVIEWDOG_GITHUB_API_TOKEN=`cat /src/token.conf`
rm /src/token.conf
