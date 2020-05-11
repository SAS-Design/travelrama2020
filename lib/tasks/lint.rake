# frozen_string_literal: true

require 'brakeman'
require 'rubocop/rake_task'
require 'rubycritic/rake_task'

namespace :lint do
  desc 'Provide code quality metrics'

  task all: :environment do
    Rake::Task['lint:brakeman'].invoke
    Rake::Task['lint:rubocop'].invoke
    Rake::Task['lint:rubycritic'].invoke
  end

  RuboCop::RakeTask.new(:rubocop) do |task|
    task.fail_on_error = true
  end

  RubyCritic::RakeTask.new do |task|
    task.paths = FileList['app/**/*.rb', 'lib/**/*.rb']
  end

  task brakeman: :environment do
    desc 'Check for security warnings'

    result = Brakeman.run app_path: '.', ignore_file: './.brakeman.ignore', print_report: true, pager: nil
    unless result.filtered_warnings.empty?
      exit Brakeman::Warnings_Found_Exit_Code
    end
  end
end

task lint: :environment do
  desc 'runs all lint tasks'

  Rake::Task['lint:all'].invoke
end
