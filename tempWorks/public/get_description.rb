require 'open-uri' #URL'e HTTP isteğinde bulunur
require 'nokogiri' #HTML'i parse etmeyi sağlar

module Description

  def Description.get_description(service_name)

    url = "http://cve.mitre.org/cgi-bin/cvekey.cgi?keyword=#{service_name}"

    page = Nokogiri::HTML(open(url))

    cve = page.css('div#TableWithRules td')[0].text
    dsc = page.css('div#TableWithRules td')[1].text

    return cve,dsc
  end
  
    def Description.get_lvl(cve_id)
    if !(cve_id.empty?)
    url = "https://www.cvedetails.com/cve-details.php?t=1&cve_id=#{cve_id}"
    page = Nokogiri::HTML(open(url))
    score = page.css('div.cvssbox').text
    puts score
    end
end

end


Description.get_lvl("CVE-2016-10499")
