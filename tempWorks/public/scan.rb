load 'description.rb'
require 'progress_bar'


system("cat logo.txt")
puts "\n Please, enter a target ip:"
ip=gets.chomp

#system("sudo nmap -sS -sV -n #{ip} > output.txt")

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
  puts i[0].split[0]
end


#puts "girilen ip #{ip}"


puts "Checking for possible vulnerabilities..."
bar2 = ProgressBar.new

100.times do
  sleep 0.1
  bar2.increment!
end

puts "Here is the list of possible vulnerabilities on existing services:"

for i in rs
  puts "For port "
  puts i[0].split[0]
  puts "CVE-id is: "
  puts Description.get_cve_no(i[0].split[3..-1].join ' ')
  puts "Description: "
  puts Description.get_description(i[0].split[3..-1].join ' ')
end


puts Description.get_description("vsftpd 2.3.4") 







