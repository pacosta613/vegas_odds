class VegasOdds::Sports
attr_accessor :name, :title, :away, :home, :odd, :champion, :challenger, :date, :date_2, :odd_2, :challenger_2, :champion_2, :odd_3, :odd_4

    def self.now
        self.scrape_sports
    end

    def self.scrape_sports
        sport = []
        sport << self.scrape_football
        sport << self.scrape_boxing
        sport << self.scrape_ufc
    end

    def self.scrape_football
    sportsbook = Nokogiri::HTML(open("https://www.sportsbook.ag/sbk/sportsbook4/nfl-betting/super-bowl-50-line.sbk"))

    sport = self.new
    sport.name = sportsbook.search("h1.titleLabel").text.gsub("Football Betting", "").strip
    sport.title = sportsbook.search("span.titleLabel").text.gsub("Line", "").strip
    sport.date = sportsbook.search("div#Foot-Carol-Denve-020716").first.previous_element.text.strip
    sport.away = sportsbook.search("span.team-title").text.gsub("Denver Broncos", "").strip
    sport.odd = sportsbook.search(".market")[2].text.strip
    sport.home = sportsbook.search("span.team-title").text.gsub("Carolina Panthers", "").strip
    sport.odd_2 = sportsbook.search(".market")[5].text.strip

    #binding.pry
    sport
    end

    def self.scrape_boxing
    sportsbook = Nokogiri::HTML(open("https://www.sportsbook.ag/sbk/sportsbook4/boxing-+-mma-betting/boxing-fight-odds.sbk"))

    sport = self.new
    sport.name = sportsbook.search("span.titleLabel").text.gsub("Fight Odds", "").strip
    sport.date = sportsbook.search("div#Pboxi-1000-Timot-Manny-040916").first.previous_element.text.strip
    sport.champion = sportsbook.search("span.team-title")[0].text
    sport.odd = sportsbook.search(".market").text.gsub("--", "").gsub("-340-380+290", "")
    sport.challenger = sportsbook.search("span.team-title")[1].text
    sport.odd_2 = sportsbook.search(".market").text.gsub("--", "").gsub("-380+290", "").gsub("+260", "")
    sport.champion_2 = sportsbook.search("span.team-title")[2].text
    sport.date_2 = sportsbook.search("div#Pboxi-1100-SaulC-AmirK-050716").first.previous_element.text.strip
    sport.odd_3 = sportsbook.search(".market").text.gsub("--", "").gsub("+260-340", "").gsub("+290", "")
    sport.challenger_2 = sportsbook.search("span.team-title")[3].text
    sport.odd_4 = sportsbook.search(".market").text.gsub("--", "").gsub("+260-340-380", "")
    
    #binding.pry
    sport
    end

    def self.scrape_ufc
    sportsbook = Nokogiri::HTML(open("https://www.sportsbook.ag/sbk/sportsbook4/boxing-+-mma-betting/ufc-matchups.sbk"))

    sport = self.new
    sport.name = sportsbook.search("span.titleLabel").text.gsub("Matchups", "").strip
    sport.date = sportsbook.search("div#X92-5005-Miesh-Holly-030516").first.previous_element.text.strip
    sport.challenger = sportsbook.search("span.team-title")[24].text
    sport.odd =  sportsbook.search(".market")[74].text
    sport.champion = sportsbook.search("span.team-title")[25].text
    sport.odd_2 = sportsbook.search(".market")[77].text
    sport.challenger_2 = sportsbook.search("span.team-title")[26].text
    sport.odd_3 = sportsbook.search(".market")[80].text
    sport.champion_2 = sportsbook.search("span.team-title")[27].text
    sport.odd_4 = sportsbook.search(".market")[83].text

    #binding.pry
    sport
    end

end