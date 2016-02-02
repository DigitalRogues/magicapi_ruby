
require 'open-uri'
require 'nokogiri'

  doc = Nokogiri::HTML(open("http://www.isitpacked.com/live-crowd-trackers/disneyland/"))

#get the div
array = doc.css("[class=entry-content] > div").first
#get the links in the array
   array.css("a").each do |button|
     unless button['style'].include? "f9f9f9"
        puts button.text.downcase
     end

   end
  # array.each do |button|
  #   puts button
  # end
