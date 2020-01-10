require 'rails_helper'

describe "GET '/sessions/new'", :type => :feature do
    it 'Shows the sign in form' do
      visit('http://localhost:3000/signin')
      expect(page).to have_content("Email")
      expect(page).to have_content("Password")
      puts 'You can enter credentials here'
    end
  end

describe "the signin process", type: :feature do
    before :each  do
        User.create(name: 'MarioDena', email: 'testbot@gmail.com', password: 'password')
      end

    it "Sign in when correct credentials" do
      visit '/sessions/new'
      find('.form-control').fill_in('name', with: 'testbot@gmail.com')

      end
      sleep(5)
      click_button 'Sign in'
      sleep(5)
      expect(page).to have_content 'Logged in'
    end
  end