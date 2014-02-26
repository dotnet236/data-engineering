namespace :spec do

  if defined? RSpec::Core::RakeTask

    desc "Run functional/model tests"
    RSpec::Core::RakeTask.new(:functional) do |t|
      t.pattern = [ "./spec/controllers/*_spec.rb", "./spec/models/*_spec.rb", "./spec/helpers/*_spec.rb", './spec/lib/**/*_spec.rb']
      t.rspec_opts = '--format h --out rspec_reports/functional.html --format progress'
    end

    desc "Run integration tests"
    RSpec::Core::RakeTask.new(:integration) do |t|
      t.pattern = './spec/requests/**/*_spec.rb'
      t.rspec_opts = '--format h --out rspec_reports/requests.html -t ~broken --format progress'
    end

    desc "Run functional/model & integration test"
    task all: [:functional, :integration]
  end
end
