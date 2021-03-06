# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'capybara/rails'
require 'capybara/rspec'
require 'capybara/poltergeist'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[
  Rails.root.join('spec/support/**/*.rb'),
  Rails.root.join('spec/factories/**/*.rb')
].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.infer_base_class_for_anonymous_controllers = false
  config.order = 'random'

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
    FactoryGirl.lint
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  # Capybara Configuration
  Capybara.javascript_driver = :poltergeist

  # Factory Girl Configuration
  config.include FactoryGirl::Syntax::Methods
end

def pause_page
  puts
  puts 'Type enter to continue'
  $stdin.gets
end
