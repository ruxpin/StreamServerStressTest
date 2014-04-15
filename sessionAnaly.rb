#! /usr/bin/env ruby
ARGV.empty? ? log_dir="log" : log_dir = ARGV[0]
total_session_count = 0
sucess_session_count = 0
play_started_session_count = 0
total_kbits_per_second_ave = 0
FailedSessions = []
StartedButNotFinishedSessions = []
Dir.foreach(log_dir) do |log_file|
  next unless log_file =~ /session_\d+\.log$/
  temp_kbits_per_second_ave = 0
  total_session_count += 1
  play_started = false
  play_finished = false
  File.open(log_dir+'/'+log_file,'r') do |f|
    f.each_line do |l|
      if l =~ /Started playing session/
        play_started = true
        play_started_session_count += 1
      end
      if l =~ /Received a complete TEARDOWN response/
        play_finished = true
      end
      if l =~ /kbits_per_second_ave/
        temp_kbits_per_second_ave += l.split(" ")[1].to_i
      end
    end
  end
  if play_started && play_finished
    sucess_session_count += 1
  elsif play_started
    StartedButNotFinishedSessions << log_file
  else
    FailedSessions << log_file
  end
  if play_finished
    total_kbits_per_second_ave += temp_kbits_per_second_ave
  end
end
puts "Total sessions:  "+total_session_count.to_s
puts "Success sessions:  "+sucess_session_count.to_s
unless sucess_session_count == 0
  puts "kbits_per_second_ave: "+(total_kbits_per_second_ave/sucess_session_count).to_s
end
puts "Failed sessions:  "+(total_session_count-sucess_session_count).to_s
puts "Play started sessions:  "+play_started_session_count.to_s
puts "Play Started but not finished sessions:  "+StartedButNotFinishedSessions.count.to_s
puts ""
puts "Play Started but not finished session log files:  "
#puts StartedButNotFinishedSessions.any? ? StartedButNotFinishedSessions.sort.join(", ") : "None"
puts ""
puts "Failed session log files:  "
#puts FailedSessions.any? ? FailedSessions.sort.join(", ") : "None"
