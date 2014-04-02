#!/bin/bash
live555ID=`ps -ef|grep '[l]ive555'|awk '{print $2}'`
cd ~/live/mediaServer
pwd
if [[ $live555ID -ne "" ]]; then
  kill -9 `ps -ef|grep '[l]ive555'|awk '{print $2}'`
  sleep 1
  ./live555MediaServer&
else
  echo No Live555StreamServer running
  ./live555MediaServer&
fi
