class WebScraper
  attr_reader :url

  def initialize
    @url = "http://crossfitdeco.com/the-workout-for-#{Time.now.month}-#{Time.now.day}-#{Time.now.year.to_s.last(2)}-is"
  end

  def parsed_message
    wod = []
    full_content.map do |a|
      if a.text !="" && !a.text.include?("\n")
        wod.push(a.text)
      end
    end
    wod.join(",")
  end

  def full_content
    page = HTTParty.get(url)
    content = Nokogiri::HTML(page)
    c = content.css('.inner-paragraph').children.css('td')

    if c.empty?
      c = content.css('.inner-paragraph').children.css('div')
    end

    c
  end

end
