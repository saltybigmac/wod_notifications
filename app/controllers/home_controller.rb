class HomeController < ApplicationController
  def index
    @phone_number = PhoneNumber.new
  end
end
