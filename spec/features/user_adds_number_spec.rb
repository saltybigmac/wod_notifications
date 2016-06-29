require 'rails_helper'

RSpec.describe 'user can add a phone number', type: :feature do
  include Capybara::DSL

  it 'can add a number' do
    visit '/'
    fill_in "Name", with: "sally"
    fill_in "Phone Number", with: "7209364687"
    click_on "Start Receiving WOD Text Notifications"
    save_and_open_page
    expect(page).to have_content("Unless it is before 6am MST, you will now
      start receiving WOD notifications daily at 6 am, starting tomorrow")

  end
end
