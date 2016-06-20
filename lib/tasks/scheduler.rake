desc "This task is called by the Heroku scheduler add-on"

task :send_wod_notification => :environment do
  return if Time.now.day == "Sunday" || Time.now.day == "Saturday"
  PhoneNumber.all.each do |number|
    WodNotification.new.send_message(number.number)
    puts "sent text to #{number.number}"
  end
end
