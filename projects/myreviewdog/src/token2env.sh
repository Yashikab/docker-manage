#!bin/sh
python /src/get_token.py
export REVIEWDOG_GITHUB_API_TOKEN=`cat /src/token.conf`
echo $REVIEWDOG_GITHUB_API_TOKEN
rm /src/token.conf
