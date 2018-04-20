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

end
