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
  end

end
