require 'open-uri'
require 'nokogiri'
require 'pp'
# {"parks":{"date":"Monday February 01 2016","disneyland":{"crowdIndex":"66","forecast":"hey, it’s alright","times":"10:00AM to 8:00PM"},"california_adventure":{"crowdIndex":"63","forecast":"hey, it’s alright","times":"10:00AM to 8:00PM"}},"lastUpdated":1454367613}

#date - PST
#last_updated - human readable
#closed
#DLR
  #open
  #close
  #forecast outlook
  #current index
#DCA
  #open
  #close
  #forecast outlook
  #current index


@mainHash = Hash.new

# class DLRObj
#   # accessor methods
#   def getForecast
#      @forecast
#   end
#
#
#   # setter methods
#   def setForecast=(value)
#      @forecast = value
#   end
#
# end
#
# class DCAObj
#   # accessor methods
#   def getForecast
#      @forecast
#   end
#   # setter methods
#   def setForecast=(value)
#      @forecast = value
#   end
# end


  def parsePacked(url)
    doc = Nokogiri::HTML(open(url))
    array = doc.css("[class=entry-content] div").first
    objs = array.css("a")
      objs.each do |button|
        unless button["style"].include? "#f9f9f9"
            return button.text.downcase
        end
      end
  end

  def trimmer(string)
    #grab the string between the (), strip the () then split it all into an array
    trimmed = string[/\(([^)]+)\)/].tr('()', '').split(' ')
    return trimmed.last
  end

  def parseWait(url)
    doc = Nokogiri::HTML(open(url))
    tempHash = Hash.new
    array = doc.css("[class=parkheading]")
    puts array
    tempHash["date"] = array[0].text
    tempHash["dlrIndex"] = trimmer(array[1].text)
    tempHash["dcaIndex"] = trimmer(array[2].text)
  end


  dlrObj = Hash.new
  dcaObj = Hash.new

  parseWait("http://www.mousewait.com/disneyland/")

  # dlrObj["forecast"] = parsePacked("http://www.isitpacked.com/live-crowd-trackers/disneyland/")
  # dcaObj["forecast"] = parsePacked("http://www.isitpacked.com/live-crowd-trackers/dca-disney-california-adventure/")
  #
  # puts dlrObj["forecast"]
