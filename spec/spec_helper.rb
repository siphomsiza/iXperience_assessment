# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'faker'
require 'factory_bot'
require 'webmock/rspec'
require 'database_cleaner'
require 'rails-controller-testing'
Rails::Controller::Testing.install

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.

RSpec.configure do |config|

  #config.include ::SignUpStepOne
  config.include Rails.application.routes.url_helpers
   
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.warnings = false
  config.infer_spec_type_from_file_location!
  config.include FactoryBot::Syntax::Methods
  ActiveSupport::Deprecation.silenced = true

  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  # config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = false

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  # config.raise_errors_for_deprecations!
  config.order = "random"
end
