#!/usr/bin/env perl
use Getopt::Long;
use Time::HiRes qw(usleep nanosleep);
$sessions=100;
GetOptions("sessions=i" => \$sessions) or die("Error in command line arguments \n");
$log_dir="log";
unlink glob "${log_dir}/*.log";
$url = "rtsp://192.168.2.10:8554/test.264";
$openRTSP = "./openRTSP";
$openRTSPPara = "-Q -b 200000";
$redirectStd = "2>&1";
for( $session_id= 1; $session_id <= $sessions; $session_id++)
{
  if( $pid = fork )
  {
  }
  elsif(defined $pid)
  {
    $log_id = sprintf("%04d",$session_id);
    exec("$openRTSP $openRTSPPara $url $redirectStd | tee log/session_${log_id}.log");
  }
  usleep(100000);
}
