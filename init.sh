#!/bin/sh
set -e

# Get environment variables to show up in SSH session
eval $(printenv | sed -n "s/^\([^=]\+\)=\(.*\)$/export \1=\2/p" | sed 's/"/\\\"/g' | sed '/=/s//="/' | sed 's/$/"/' >> /etc/profile)

echo $SSH_PASSWD
echo $PORT
echo $HELLO

printenv > env.json

# export CONFIG_JSON_FILE=config.json
# cat $CONFIG_JSON_FILE | envsubst '
#     $SSH_PASSWD 
#     $HELLO'> $CONFIG_JSON_FILE

# exec "$@"

service ssh start
node /code/server.js
