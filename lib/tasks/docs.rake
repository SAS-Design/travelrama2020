# frozen_string_literal: true

require 'rails-erd'
require 'yard'

namespace :docs do
  desc 'updates documentation'

  task all: :environment do
    Rake::Task['docs:yard'].invoke
  end

  YARD::Rake::YardocTask.new do |t|
    t.options = ['-odocs', '-rREADME.md']
    t.stats_options = ['--list-undoc']
  end
end

Rake::Task['docs:yard'].enhance do
  return unless Rails.env.development?

  RailsERD.load_tasks
  version = `git describe --tags --always`
  if Rails.root.join('config', 'version').open('w') { |file| file.write version }.positive?
    puts "Version bumped to #{version}"
  end
end

task docs: :environment do
  desc 'runs all documentation tasks'

  Rake::Task['docs:all'].invoke
end
