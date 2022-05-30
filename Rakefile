# frozen_string_literal: true

require 'rspec/core/rake_task'

task :tests => [:spec]

desc 'Run all tests'
RSpec::Core::RakeTask.new do |t|
  t.pattern = 'spec/tests/*_test.rb'
  t.verbose = true
  t.rspec_opts = '--format html --out reports/results.html'
end
