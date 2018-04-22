puts "Scanning report file in format is under the inspectorScandAll_reports directory. Would you like to open it now? [Y/N]"
resp = gets.chomp
case resp
when ("y" or "Y")
 latest_file = `ls -t | head -n 1`
 system("xdg-open #{latest_file}")
when ("n" or "N")
 exit 
end
