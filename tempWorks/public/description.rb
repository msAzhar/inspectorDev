require 'open-uri' #URL'e HTTP isteğinde bulunur
require 'nokogiri' #HTML'i parse etmeyi sağlar

module Description


  def self.get_description(service_name)

  if !(service_name.empty?)
  url = "http://cve.mitre.org/cgi-bin/cvekey.cgi?keyword=#{service_name}"

  page = Nokogiri::HTML(open(url))

  cve_id = page.css('div#TableWithRules td')[0].text
  desc = page.css('div#TableWithRules td')[1].text
  return cve_id,desc
  end
  end

  def self.get_lvl(cve_id)
    if !(cve_id.empty?)
    url = "https://www.cvedetails.com/cve-details.php?t=1&cve_id=#{cve_id}"
    page = Nokogiri::HTML(open(url))
    score = page.css('div.cvssbox')[0].text
    return score
    end
   end

end




#get_description("vsftpd 2.3.4") 
