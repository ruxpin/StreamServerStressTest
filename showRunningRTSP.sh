#!/bin/bash
sessions_count=`ps -ef | grep 'sh -c.*[o]penRTSP' | wc -l` 
if [ $sessions_count == "0" ]; then
  echo No living openRTSP session
else
  ps -ef | grep 'sh -c.*[o]penRTSP' | awk '{print "Living openRTSP session",NR,"->","running with logfile ->",$18}'
  echo Total running sessions:  $sessions_count
fi
