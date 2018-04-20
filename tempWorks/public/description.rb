require 'open-uri' #URL'e HTTP isteğinde bulunur
require 'nokogiri' #HTML'i parse etmeyi sağlar

module Description


def self.get_description(service_name)

  if !(service_name.empty?)
  url = "http://cve.mitre.org/cgi-bin/cvekey.cgi?keyword=#{service_name}"

  page = Nokogiri::HTML(open(url))

  puts page.css('div#TableWithRules td')[1].text
  end
end


def self.get_cve_no(service_name)

  if !(service_name.empty?)
  url = "http://cve.mitre.org/cgi-bin/cvekey.cgi?keyword=#{service_name}"

  page = Nokogiri::HTML(open(url))

  puts page.css('div#TableWithRules td')[0].text
  end
end

end

#get_description("vsftpd 2.3.4") 
