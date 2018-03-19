puts "Please, enter a target ip:"
ip=gets.chomp

system("sudo nmap -sS -sV -n #{ip}")
