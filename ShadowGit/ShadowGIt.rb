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
time = Time.new

FileWatcher.new([$dir]).watch() do |filename, event|
  puts "Do you approve the new change at " + time.hour + ":" + time.min + ":" + time.sec + " to be commited?"
  approve = gets.chomp
  if(event == :changed and approve == "y")
    puts "File updated: " + filename
	puts "=-=-="
	puts
	system "start " + $dir + "/Speedy_Git.bat"
  end
  if(event == :delete and approve == "y")
    puts "New File Action: " + filename
	puts "=-=-="
	puts
	system "start " + $dir + "/Speedy_Git.bat"
  end
end
