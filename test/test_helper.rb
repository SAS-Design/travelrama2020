ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

require 'simplecov'
SimpleCov.start do
  command_name 'Travelrama'
  coverage_dir 'tmp/coverage'
  enable_coverage :branch
  add_group 'Models', 'app/models'
  add_group 'Controllers', 'app/controllers'
  add_group 'Mailers', ['app/mailers', 'app/mailboxes']
  add_group 'Helpers', 'app/helpers'
  add_group 'Lib', 'lib/'
  add_filter %r{^/config/}
  add_filter %r{^/test/}
end

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  setup do
  	Bullet.start_request if Bullet.enable?
  end

  teardown do
  	Bullet.perform_out_of_channel_notifications if Bullet.enable? && Bullet.notification?
    Bullet.end_request if Bullet.enable?
  end

end
