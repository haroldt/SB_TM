namespace :test do
  desc 'Test factories'
  Rake::TestTask.new(:factories) do |t|
    t.pattern = './test/factories_test.rb'
  end
end

task minitest: 'test:factories'
