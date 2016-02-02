require 'open-uri'
require 'nokogiri'
require 'ap'
require 'mongo'

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
    tempHash["date"] = array[0].text
    tempHash["dlrIndex"] = trimmer(array[1].text)
    tempHash["dcaIndex"] = trimmer(array[2].text)
    tempHash["closed"] = array[4].text

    times = doc.css("[class=parkTiming]")
    tempHash["dlrTime"] = times[0].text
    tempHash["dcaTime"] = times[1].text

    return tempHash
  end


  def mongoFunction(hash)
    client = Mongo::Client.new([ 'northrend.digitalrogues.com:27017' ], :database => 'magicAPI', :user => 'magic', :password => 'tech0410')

    #
     result = client[:magicObj].insert_one({ date: hash["date"],lastUpdated: hash["lastUpdated"], lastUpdated_unix: hash["lastUpdated_unix"], closed: hash["closed"],
       dlr:{crowdIndex:hash["dlrIndex"], times:hash["dlrTime"], forecast: hash["dlrForecast"]},
       dca:{crowdIndex:hash["dcaIndex"], times:hash["dcaTime"], forecast: hash["dcaForecast"]}
       })
      puts result #=> returns 1, because 1 document was inserted.
  end

#   {
#            "date" => "Monday February 01 2016",
#        "dlrIndex" => "55",
#        "dcaIndex" => "76",
#          "closed" => "Closed for refurbishment: Mark Twain Riverboat,Sailing Ship Columbia,Davy Crockett's Explorer Canoes,Pirate's Lair on Tom Sawyer Island,Jungle Cruise,Autopia,\"it's a small world\",Fantasmic!,Disneyland Railroad,20th Century Music Company ",
#         "dlrTime" => "10:00AM to 8:00PM",
#         "dcaTime" => "10:00AM to 8:00PM",
#     "dlrForecast" => "hey, it’s alright",
#     "dcaForecast" => "hey, it’s alright",
#     "lastUpdated" => "Monday, 01 Feb 2016  6:07 PM"
# }


  @mainHash = parseWait("http://www.mousewait.com/disneyland/")
  @mainHash["dlrForecast"] = parsePacked("http://www.isitpacked.com/live-crowd-trackers/disneyland/")
  @mainHash["dcaForecast"] = parsePacked("http://www.isitpacked.com/live-crowd-trackers/dca-disney-california-adventure/")
  @mainHash["lastUpdated"] = Time.new.strftime("%A, %d %b %Y %l:%M %p")
  @mainHash["lastUpdated_unix"] = Time.new.to_i
  ap @mainHash
  mongoFunction(@mainHash)

  #
  # puts dlrObj["forecast"]
