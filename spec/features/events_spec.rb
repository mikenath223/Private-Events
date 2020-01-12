# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Events', type: :feature do
  before :each do
    User.create(name: 'Michgolden', email: 'michgold@gmail.com', password: 'password')
  end

  it 'Creates an event' do
    visit 'signin'
    find('#signin-email').fill_in('session_email', with: 'michgold@gmail.com')
    click_button 'Log in'
    sleep(5)
    visit 'events/new'
    fill_in('Date', with: Time.zone.now)
    fill_in('Location', with: 'Near you')
    fill_in('Description', with: 'Creme de la creme')
    click_button 'Create Event'
    sleep(5)
    expect(page).to have_content('Event created!')
  end
end
