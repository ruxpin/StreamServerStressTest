#!/usr/bin/env perl
use Getopt::Long;
use Time::HiRes qw(usleep nanosleep);
$sessions=1;
$url = "rtsp://192.168.0.100:554";
$duration = 300;
GetOptions("sessions=i" => \$sessions,
           "url=s" => \$url,
           "duration=i" => \$duration) or die("Error in command line arguments \n");
$log_dir="log";
unlink glob "${log_dir}/*.log";
$openRTSP = "./openRTSP";
$openRTSPPara = "-Q -b 300000 -d $duration";
$redirectStd = "2>&1";
for( $session_id= 1; $session_id <= $sessions; $session_id++)
{
  if( $pid = fork )
  {
  }
  elsif(defined $pid)
  {
    $log_id = sprintf("%04d",$session_id);
    exec("$openRTSP $openRTSPPara $url $redirectStd | tee ${log_dir}/session_${log_id}.log");
    last;
  }
  usleep(100000);
}
