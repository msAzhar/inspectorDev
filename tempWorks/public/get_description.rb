require 'open-uri' #URL'e HTTP isteğinde bulunur
require 'nokogiri' #HTML'i parse etmeyi sağlar

def get_description(service_name)

  url = "http://cve.mitre.org/cgi-bin/cvekey.cgi?keyword=#{service_name}"

  page = Nokogiri::HTML(open(url))

  puts page.css('div#TableWithRules td')[1].text

end

# => get_description("vsftpd 2.3.4") şeklinde çağırılır.
