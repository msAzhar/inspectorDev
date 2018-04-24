module Lang
  def self.enter_ip(lang)
   case lang
   when "tr","TR"
   puts "\nLütfen, hedef ip'yi giriniz:".light_blue
   when "en","EN"
   puts "\nPlease, enter a target ip:".light_blue
   when "ru","RU"
   puts "\nПожалуйста, введите IP адрес:".light_blue
   else
   puts "\nNot supported language!".light_red
   exit
   end
  end
  
  def self.scanning_ip(lang)
   case lang
   when "tr","TR"
   puts "\nTarama işlemi başlatılmıştır...".yellow
   when "en","EN"
   puts "\nScanning process is started...".yellow
   when "ru", "RU"
   puts "\nИдет процесс сканирования..".yellow
   else
   puts "\n Not supported language!".red
   end
end

  def self.found_vulns(lang)
   case lang
   when "tr", "TR"
   puts "\nMakinede bulunan açık portların listesi:".green
   when "en", "EN"
   puts "\nHere is the list of opened ports on the host:".green
   when "ru", "RU"
   puts "\nСписок открытых портов на хосте:".green
   else
   puts "\n Not supported language!".red
   end
end

  def self.port_status(lang,port_no)
   case lang
   when "tr", "TR"
   puts "\n#{port_no} portunun durumu açıktır."
   when "en", "EN"
   puts "The status of port #{port_no} is open."
   when "ru", "RU"
   puts "\nПорт под номером #{port_no} открыт."
   else
   puts "\n Not supported language!".red
   end
end

  def self.check_vulns(lang)
   case lang
   when "tr", "TR"
   puts "\nOlası açıklar kontrolü...".yellow
   when "en", "EN"
   puts "\nChecking for possible vulnerabilities...".yellow
   when "ru", "RU"
   puts "\nИдет процесс проверки на уязвимость...".yellow
   else
   puts "\n Not supported language!".red
   end
end

  def self.list_vulns(lang)
   case lang
   when "tr", "TR"
   puts "\nMevcut servislerin içerdiği olası açıklarının listesi:".green
   when "en", "EN"
   puts "\nHere is the list of possible vulnerabilities on existing services:".green
   when "ru", "RU"
   puts "\nСписок возможных уязвимостей на существующих сервисах:".green
   else
   puts "\n Not supported language!".red
   end
end
  
  def self.report(lang)
   case lang
   when "tr", "TR"
   puts "Inspector ScanDAll Raporu\n"
   when "en", "EN"
   puts "Inspector ScanDAll Reports\n"
   when "ru", "RU"
   puts "Отчет Inspector ScanDAll\n"
   else
   puts "\n Not supported language!".red
   end
end

  def self.file_formats(lang)
   case lang
   when "tr", "TR"
   puts "\nDosya biçimleri: txt, pdf, odt, md, xml".light_blue
   puts "Lütfen, istediğiniz dosya biçimini giriniz: ".light_blue
   when "en", "EN"
   puts "\nFile Formats are: txt, pdf, odt, md, xml".light_blue
   puts "Please, enter desired file format: ".light_blue
   when "ru", "RU"
   puts "\nПоддерживаемые типы файла: txt, pdf, odt, md, xml".light_blue
   puts "Пожалуйста, введите тип файла: ".light_blue
   else
   puts "\n Not supported language!".red
   end
end


  def self.report_in_dir(lang,f_format)
   case lang
   when "tr", "TR"
   puts "\nInspector ScanDAll: #{f_format} biçimindeki raporu inspectorScandAll_reports  dizini altındadır. Şimdi açılsın mı? [E/H]".green
   when "en", "EN"
   puts "\nInspector ScanDAll: report file in #{f_format} format is under the inspectorScandAll_reports directory. Would you like to open it now? [Y/N]".green
   when "ru", "RU"
   puts "\nInspector ScanDAll: Отчет в формате #{f_format} находится в папке inspectorScandAll_reports. Открыть отчет? [Д/Н]".green
   else
   puts "\n Not supported language!".red
   end
end

end
