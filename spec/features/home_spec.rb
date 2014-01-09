require 'spec_helper'

feature 'user visits homepage' do 

	scenario 'is welcomed' do 
		visit('/')
		expect(page).to have_content('Hello')
	end

	scenario 'signs up' do 
		visit('/')
		click_link 'Sign Up'
		expect(page).to have_content('Email')
		fill_fields
		find("#modal-sign-up").click
		expect(page).to have_content('Sinatra')
	end

	def fill_fields
		fill_in :inputEmail3, with: 'nkeszler10@test.com'
		fill_in :inputFirst3, with: 'nicki'
		fill_in :inputLast3, with: 'test'
		fill_in :inputPassword3, with: 'abc'
		fill_in :inputPasswordC3, with: 'abc'
	end

end