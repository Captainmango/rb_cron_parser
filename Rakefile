# frozen_string_literal: true

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/test_*.rb']
end

namespace :test do
  desc "This is a test task"
  task :thing do
    puts "test"
  end
end

namespace :types do
  desc "regenerate type information for lib"
  task :generate do
    system('sord sig/types.rbs')
  end
end

require 'rubocop/rake_task'

RuboCop::RakeTask.new

task default: %i[test rubocop]
