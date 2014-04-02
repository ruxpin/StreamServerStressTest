#!/bin/bash
tokill=`ps -ef|grep 'sh -c.*[o]penRTSP'|awk '{printf $2" "}'`
sessions_count=`echo $tokill|wc -w`
if echo $tokill | egrep -q '[0-9]'; then 
  kill -9 $tokill
  echo Killed $sessions_count sessions
else
  echo No living openRTSP to kill
fi
