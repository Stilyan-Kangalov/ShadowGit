require 'filewatcher'
puts "###############################################################################"
puts "############################## Shadow Git #####################################"
puts
puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
puts "Start Monitoring: " + Dir.pwd
puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
puts

$dir = Dir.pwd
approve = ""

FileWatcher.new([$dir]).watch() do |filename, event|
  hour = Time.new.hour.to_s
  min = Time.new.min.to_s
  sec = Time.new.sec.to_s
  current_time = hour + ":" + min + ":" + sec
  puts "Do you approve the change at " + current_time + " to be commited? (y/n)"
  approve = gets.chomp
  if(event == :changed and approve == "y")
    puts "=-=-="
    puts "File updated: " + filename
	puts "=-=-="
	puts
	system "start " + $dir + "/Speedy_Git.bat"
  end
  if(event == :delete and approve == "y")
    puts "=-=-="
    puts "New File Action: " + filename
	puts "=-=-="
	puts
	system "start " + $dir + "/Speedy_Git.bat"
  end
end
