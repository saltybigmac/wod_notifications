class WodNotification
  def initialize
    @client = Twilio::REST::Client.new(ENV["twilio_sid"], ENV["twilio_token"])
  end

  def send_message(number)
    @client.messages.create from: '7205063550', to: number, body: WebScraper.new.parsed_message
  end
end
