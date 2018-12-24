#!/bin/bash

curl -s -L https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz -o /tmp/gotty.tar.gz
tar xzf /tmp/gotty.tar.gz -C /tmp/ && rm /tmp/gotty.tar.gz
/tmp/gotty -w --port 7591 /bin/bash &

curl -s -L https://bin.equinox.io/a/iVLSfdAz1X4/ngrok-stable-linux-amd64.tar.gz -o /tmp/ngrok.tar.gz
tar xzf /tmp/ngrok.tar.gz -C /tmp/ && rm /tmp/ngrok.tar.gz
/tmp/ngrok http 7591 &
sleep 5

echo
echo
echo
echo Tunnel address:
curl -s http://127.0.0.1:4040/status | egrep -o -e "https://[a-z0-9]{1,8}.ngrok.io"

echo
echo OK
