require 'rake/testtask'

Rake::TestTask.new do |task|
  task.libs << %w(test lib)
  task.pattern = 'test/test_*.rb'
  task.verbose = true
end

namespace :test do
  desc 'Test factories'
  Rake::TestTask.new(:factories) do |t|
    t.pattern = './test/test_factories.rb'
  end
end

task minitest: 'test:factories'

task :default => :test
