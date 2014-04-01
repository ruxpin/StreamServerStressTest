#!/bin/bash
tokill=`ps -fea|grep openRTSP|awk '{printf $2" "}'`;
kill -9 $tokill
