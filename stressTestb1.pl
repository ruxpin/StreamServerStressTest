#!/usr/bin/env perl
use Getopt::Long;
use Time::HiRes qw(usleep nanosleep);
$sessions=300;
GetOptions("sessions=i" => \$sessions) or die("Error in command line arguments \n");
$log_dir="log";
unlink glob "${log_dir}/*.log";
$url_pre = "rtsp://192.168.2.10:";
$url_after = "/proxyStream";
$openRTSP = "./openRTSP";
$openRTSPPara = "-Q -b 300000 -d 600";
$redirectStd = "2>&1";
for( $session_id= 1; $session_id <= $sessions; $session_id++)
{
  if( $pid = fork )
  {
    usleep(100000);
  }
  elsif(defined $pid)
  {
    $log_id = sprintf("%04d",$session_id);
    $url = sprintf("%s%d%s",$url_pre,$session_id+9000,$url_after);
    exec("$openRTSP $openRTSPPara $url $redirectStd | tee log/session_${log_id}.log");
  }
}
