require 'filewatcher'

puts "Lets Start Monitoring"

FileWatcher.new(["G:/Side_Project/Snipenator"]).watch() do |filename, event|
  if(event == :changed)
    puts "File updated: " + filename
	system "start G:\\Side_Project\\Snipenator\\Speedy_Git.bat"
  end
  if(event == :delete)
    puts "New File Action: " + filename
	system "start G:\\Side_Project\\Snipenator\\Speedy_Git.bat"
  end
end

