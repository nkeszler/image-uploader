require 'spec_helper'

feature 'user visits homepage' do 

	scenario 'is welcomed' do 
		visit('/')
		expect(page).to have_content('Hello')
	end

	scenario 'signs up' do 
		visit('/')
		click_link 'Sign Up'
		expect(page).to have_content('Email:')
	end

end