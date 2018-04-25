require 'combine_pdf'

module Report

  def self.make_dir
    current_dir = Dir.pwd + '/inspectorScandAll_reports'
    unless Dir.exists?("inspectorScandAll_reports")
    creat_dir = Dir.mkdir("#{current_dir}")
    end
    Dir.chdir("inspectorScandAll_reports")
   
  end
=begin
  def self.make_report(cve_id,descr)
    
    f.puts(cve_id,"\n",descr,"\n")
    end
  end
=end
  def self.convert_report(file_format)
    time = Time.new
    t = time.strftime("%Y-%m-%d-%H:%M:%S")
    system("pandoc out_file.txt -o report_file-"+ t + "." + file_format)
    File.delete("out_file.txt")  
    latest_file = `ls -t | head -n 1`
    return latest_file 
  end

  def self.add_mark(r)
   # Dir.chdir("..")
    puts `pwd`
    inspector_logo = CombinePDF.load("watermark.pdf").pages[0]
  #Dir.chdir("inspectorScandAll_reports")
    latest_file = `ls -t | head -n 1 2>/dev/null`
    puts "#{latest_file}"
    report_file = CombinePDF.load "\"#{latest_file}\""
    # inject the logo to each page in the content
    report_file.pages.each {|page| page << inspector_logo}

    # save to a new file, with the logo.
    report_file.save "deneme.pdf"
   
  end
  
  
 def self.get_solution(solution_file)
   Dir.chdir("..")
   data=''
   f = File.open(solution_file,"r") 
   f.each_line do |line|
     data+=line
   end
   Dir.chdir("inspectorScandAll_reports")
   return data
 end


end
