#!/bin/bash

curl -s -L https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz -o /tmp/gotty.tar.gz
tar xzf /tmp/gotty.tar.gz -C /tmp/ && rm /tmp/gotty.tar.gz
/tmp/gotty -w --port 7591 /bin/bash &

curl -s -L https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip -o /tmp/ngrok.zip
unzip /tmp/ngrok.zip -d /tmp && rm /tmp/ngrok.zip
/tmp/ngrok authtoken 7GDENoRsBHCTJCzbsfkzN_33paVuz9G4k4hAVkSMYXL
/tmp/ngrok tcp 7591 &
curl -s -L http://localhost:4040/inspect/tcp

echo OK
