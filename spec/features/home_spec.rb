require 'spec_helper'

feature 'user visits homepage' do 

	scenario 'is welcomed' do 
		visit('/')
		expect(page).to have_content('Hello')
	end

end