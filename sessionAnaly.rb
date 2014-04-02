#! /usr/bin/env ruby
#sessions = ARGV[0].to_i
total_session_count = 0
sucess_session_count = 0
play_started_session_count = 0
FailedSessions = []
StartedButNotFinishedSessions = []
Dir.foreach("log") do |log_file|
  next unless log_file =~ /\.log$/
  total_session_count += 1
  play_started = false
  play_finished = false
  File.open('log/'+log_file,'r') do |f|
    f.each_line do |l|
      if l =~ /Started playing session/
        play_started = true
        play_started_session_count += 1
      end
      if l =~ /Received a complete TEARDOWN response/
        play_finished = true
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
end
puts "Total sessions:  "+total_session_count.to_s
puts "Success sessions:  "+sucess_session_count.to_s
puts "Failed sessions:  "+(total_session_count-sucess_session_count).to_s
puts "Play started sessions:  "+play_started_session_count.to_s
puts "Play Started but not finished sessions:  "+StartedButNotFinishedSessions.count.to_s
puts ""
puts "Play Started but not finished session log files:  "
puts StartedButNotFinishedSessions.any? ? StartedButNotFinishedSessions.sort.join(", ") : "None"
puts ""
puts "Failed session log files:  "
puts FailedSessions.any? ? FailedSessions.sort.join(", ") : "None"
