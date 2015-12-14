#!/usr/bin/env perl
use Getopt::Long;
use Time::HiRes qw(usleep nanosleep);
use POSIX qw(strftime);
$timeStamp = strftime "%Y%m%d%H%M%S",localtime;
$proxyServer = "./live555ProxyServer";
$sessions=10;
$randomSession=0;
@streamSrcs =(["rtsp://192.168.0.100:554","8554"]);
GetOptions("sessions=i" => \$sessions,"random|r" => \$randomSession) or die("Error in command line arguments \n");
push(@streamSrcs,["rtsp://192.168.0.101:554","8555"]) if $randomSession;
printf "Starting main proxy server ----->\n\n";
foreach $streamSrc (@streamSrcs) {
  if ( $pid = fork ) {
    usleep(1000000);
  }
  elsif (defined $pid) {
    exec("$proxyServer -p $streamSrc->[1] $streamSrc->[0]");
  }
}
usleep(5000000);
printf "Starting sub proxy servers ----->\n\n";
for( $session_id= 1; $session_id <= $sessions; $session_id++)
{
  if( $pid = fork )
  {
    usleep(100000);
  }
  elsif(defined $pid)
  {
    $portnum = sprintf("%04d",$session_id+9000);
    $srcPortnum = @streamSrcs[int(rand(scalar(@streamSrcs)))]->[1];
    exec("$proxyServer -p $portnum rtsp://127.0.0.1:$srcPortnum/proxyStream");
  }
}
usleep(1000000);
printf "\nAll $sessions proxy servers started!\n";
exec("./showRunningProxy > proxyInfo_$timeStamp.txt");
