#!/bin/bash
sessions_count=$(ps -eo args| grep 'sh -c.*[o]penRTSP' | wc -l)
if [ $sessions_count == "0" ]; then
  echo No living openRTSP session
else
  ps -eo stime,etime,args | grep 'sh -c.*[o]penRTSP' | awk '{print NR,"| Living openRTSP session -> remote port",substr($11,21,4),"->","started at",$1,"-> running time",$2,"-> logfile ->",$15}'
  echo Total running sessions:  $sessions_count
fi
