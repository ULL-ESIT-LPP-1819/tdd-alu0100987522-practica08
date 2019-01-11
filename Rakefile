require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task :p12 do
    sh 'bundle exec rspec spec/p12_spec.rb'
end 
