#!/usr/bin/env perl
use Getopt::Long;
$sessions=100;
GetOptions("sessions=i" => \$sessions) or die("Error in command line arguments \n");
$log_dir="log";
unlink glob "${log_dir}/*.log";
$url = "rtsp://192.168.2.10:8554/test.mkv";
$openRTSP = "/home/streamer/live/testProgs/openRTSP";
$openRTSPPara = "-Q";
$redirectStd = "2>&1";
if( $pid = fork )
{
}
elsif(defined $pid)
{
  $log_id = sprintf("%04d",$session_id);
  exec("$openRTSP $openRTSPPara $url $redirectStd | tee log/session_${log_id}.log");
}
