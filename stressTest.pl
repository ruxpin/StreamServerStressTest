#!/usr/bin/perl
use Getopt::Long;
$sessions=100;
GetOptions("sessions=i" => \$sessions) or die("Error in command line arguments \n");
$log_dir="log";
unlink glob "$log_dir/*.log";
$session_id = 0;
$url = "rtsp://127.0.0.1:8554/test.mkv";
@cmdline = ("/home/streamer/live/testProgs/openRTSP","","");
for( $session_id= 1; $session_id <= $sessions; $session_id++)
{
  if( $pid = fork)
  {
  }
  elsif( defined $pid )
  {
    open(STDOUT,(sprintf "> log/session%d.log",$session_id));
    open(STDERR,(sprintf ">> log/session%d.log",$session_id));
    $cmdline[1] = sprintf "-Q";
    $cmdline[2] = sprintf "%s",$url;
    exec(@cmdline);
  }
}
