#!/bin/bash
ps -ef | grep 'sh -c.*[o]penRTSP' | awk '{print "Living openRTSP session",NR,"->","running with logfile ->",$16}'
