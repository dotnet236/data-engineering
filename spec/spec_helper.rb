puts "HERE"
ENV["RAILS_ENV"] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

#Dir[
#  Rails.root.join("spec/support/**/*.rb").to_s].each do |f|
#    require f
#  end

#Change the directory that FactoryGirl scans for factories
#FactoryGirl.definition_file_paths = [ File.join(Rails.root, 'spec/factories/factory_girl') ]
