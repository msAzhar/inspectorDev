load 'description.rb'
load 'report.rb'
require 'progress_bar'


system("cat logo.txt")
puts "\n Please, enter a target ip:"
ip=gets.chomp

system("sudo nmap -sS -sV -n #{ip} > output.txt")

result = File.read('output.txt')
rs= result.scan(/^(\d+.*)$/)

puts "Scanning process is started..."
bar = ProgressBar.new

100.times do
  sleep 0.1
  bar.increment!
end

puts "Here is the list of opened ports on the host:"
for i in rs
	puts "The status of port #{i[0].split[0]} is open."
end


#puts "girilen ip #{ip}"


puts "Checking for possible vulnerabilities..."
bar2 = ProgressBar.new

100.times do
  sleep 0.1
  bar2.increment!
end


puts "Here is the list of possible vulnerabilities on existing services:"
Report.make_dir #prepare a folder for reports

out = File.open("out_file.txt","w") do |f|
f.puts("Inspector ScanDAll Reports\n")
for i in rs  
  cve_id,descr = Description.get_description(i[0].split[3..-1].join ' ')

  puts "For port: #{i[0].split[0]}"
  puts "CVE-id is:", cve_id
  puts "\nDescription: "
  puts descr
  f.puts("\n",cve_id,"\n",descr)
  #Report.make_report(cve_id,descr)
end

end#File

puts "File Formats are: txt, pdf, odt, md, xml"
puts "Please, enter desired file format: "
f_format = gets.chomp
Report.convert_report(f_format)
puts "Inspector ScanDAll: report file in #{f_format} format is under the inspectorScandAll_reports directory."

puts "Scanning report file in #{f_format} format is under the inspectorScandAll_reports directory. Would you like to open it now? [Y/N]"
resp = gets.chomp
case resp
when ("y" or "Y")
 latest_file = `ls -t | head -n 1`
 system("xdg-open #{latest_file} 2>/dev/null")
when ("n" or "N")
 exit 
end
 








