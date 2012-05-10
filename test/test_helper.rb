require 'bundler/setup'
require 'pathname'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'active-list'
dummy_path = Pathname.new(__FILE__).dirname.join("dummy")

`cd #{dummy_path} && bundle exec rake db:migrate RAILS_ENV=test`

# CURRENT FILE :: test/test_helper.rb
# Configure Rails Environment
ENV["RAILS_ENV"] = "test"
ENV["RAILS_ROOT"] = dummy_path.to_s

require dummy_path.join("config", "environment.rb")
require "rails/test_help"

ActionMailer::Base.delivery_method = :test
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.default_url_options[:host] = "test.com"

Rails.backtrace_cleaner.remove_silencers!

# Run any available migration
# ActiveRecord::Migrator.migrate(dummy_path.join("db", "migrate"))

# Load support files
# Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
