#!/bin/bash

export TEMP_DIR=`mktemp -d`
export TERM=xterm

cd $TEMP_DIR

curl -s -L https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz -o gotty.tar.gz
tar xzf gotty.tar.gz
./gotty -w --port 7591 /bin/bash &

curl -s -L https://bin.equinox.io/a/iVLSfdAz1X4/ngrok-stable-linux-amd64.tar.gz -o ngrok.tar.gz
tar xzf ngrok.tar.gz
./ngrok http 7591 >/dev/null &
sleep 5

echo
echo
echo
echo Tunnel address:
curl -s http://127.0.0.1:4040/status | egrep -o -e "https://[a-z0-9]{1,8}.ngrok.io"

echo
echo OK
