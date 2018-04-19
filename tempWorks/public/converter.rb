$LOAD_PATH << '.'
require 'get_description'

def file_convert(srv_name)

  current_dir = Dir.pwd + '/inspectorScandAll_reports'
  unless Dir.exists?("inspectorScandAll_reports")
    creat_dir = Dir.mkdir("#{current_dir}")
  end 

  puts "Dosya tipleri: txt, pdf, odt, md,xml"
  puts "Lütfen istediğiniz dosya tipini yazınız: "
  type = gets.chomp

  cve,description = Description.get_description(srv_name)

  Dir.chdir("inspectorScandAll_reports") do
    out = File.open("out_file.txt","w")
    out.puts(cve,"\n",description)
    out.close
    case type
    when "txt"
      system("pandoc out_file.txt -o report_file.txt")
    when "pdf"
      system("pandoc out_file.txt -o report_file.pdf")
    when "odt"
      system("pandoc out_file.txt -o report_file.odt")
    when "md"
      system("pandoc out_file.txt -o report_file.md")
    when "xml"
      system("pandoc out_file.txt -o report_file.xml")
    end
    File.delete("out_file.txt")
  end

end

# => file_convert("vsftpd 2.3.4") şeklinde çağırılır.
