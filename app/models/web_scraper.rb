class WebScraper
  def initialize
  end

  def parsed_message
    url = "http://crossfitdeco.com/the-workout-for-#{Time.now.month}-#{Time.now.day}-#{Time.now.year.to_s.last(2)}-is"
    page = HTTParty.get(url)
    content = Nokogiri::HTML(page)

    wod = []
    content.css('.inner-paragraph').children.css('td').map do |a|
      if a.text !="" && !a.text.include?("\n")
        wod.push(a.text)
      end
    end
    wod.join(",")
  end

end
