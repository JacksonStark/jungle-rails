# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Visitor navigates to the login page', type: :feature, js: true do
  # SETUP
  before :each do
    User.create!(name: 'Jackson Stark', email: 'jackson@stark.com', password: 'secret', password_confirmation: 'secret')
  end

  scenario 'They submit form and see login update to their name' do
    # ACTION
    visit login_path
    fill_in 'email', with: 'jackson@stark.com'
    fill_in 'password', with: 'secret'
    find_button('Submit').click

    # DEBUG / VERIFY
    expect(page).to have_content 'Jackson Stark'

    save_screenshot

    puts page.html
  end
end
