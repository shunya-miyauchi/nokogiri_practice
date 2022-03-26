class ApplicationController < ActionController::Base

  def scrapes(url)
    require 'open-uri'

    html = URI.open("#{url}").read
    doc = Nokogiri::HTML.parse(html)
    
    href = doc.xpath("//h2[@class='eo-event-title entry-title']//a").map {|f| f.attribute("href").value}

    href.map do |link|
      # sleep 1
      doc = Nokogiri::HTML(URI.open("#{link}"))
      info = {  date: doc.xpath("//div[@class='date']").text,
                main_title: doc.xpath("//div[@class='main_title']").text,
                detail: doc.xpath("//div[@class='detail']").text.gsub!(/\n|\r|\r\n/, " / ")
      }
    end
  end

end
