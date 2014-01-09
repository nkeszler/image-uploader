require 'spec_helper'

feature 'user signs up' do 

	scenario 'is welcomed' do 
		visit('/user')
		expect(page).to have_content('Hello')
	end

	scenario 'signs up' do 
		visit('/')
		click_link 'Sign Up'
		expect(page).to have_content('Email')
	end

end