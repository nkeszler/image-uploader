require 'capybara/rspec'
require_relative '../app/application'
require 'database_cleaner'

ENV["RACK_ENV"] = 'test'

Capybara.app = ImageUploader

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'random'

  config.before(:suite) do 
  	DatabaseCleaner.strategy = :transaction
  	DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do 
  	DatabaseCleaner.start
  end

  config.after(:each) do
  	DatabaseCleaner.clean
  end

end
