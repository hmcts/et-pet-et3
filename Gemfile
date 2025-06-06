source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '8.0.2'
gem 'rack', '~> 2.2.3' # Currently, we cannot use rack 3 because of an issue proxying the file uploads
# Azure deployment so we need this
gem 'azure_env_secrets', git: 'https://github.com/hmcts/azure_env_secrets.git', tag: 'v1.0.1'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.10'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'sprockets', '~> 4.2.0'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'slim-rails', '~> 3.6.0'
gem 'stimulus-rails', '~> 1.3', '>= 1.3.3'
gem 'jquery-rails', '~> 4.5'
gem 'activerecord-nulldb-adapter', '~> 1.0'
gem 'httparty', '~> 0.17'
gem 'uk_postcode', '~> 2.1'
# Add .env file to store environment variables
gem 'dotenv-rails', '~> 3.1'
gem 'invisible_captcha', '~> 2.3'
gem 'devise', '~> 4.9.0'
gem 'base32_pure', '~> 0.1'
gem 'iodine', '~> 0.7.47'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'bundler-audit', '~> 0.9.1'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 3.34'
  gem 'selenium-webdriver', '~> 4.18'
  gem 'rubocop', '~> 1.8', :require => false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', '~> 3.3', :require => false
  gem 'rubocop-capybara', '~> 2.21', :require => false
  gem 'rubocop-factory_bot', '~> 2.26', :require => false
  gem 'rubocop-rspec_rails', '~> 2.30', :require => false
  gem 'simplecov', '~> 0.21'
  gem 'pry', '~> 0.12'
  # Run Rspec tests in parallel to speed the test suite up
  gem 'parallel_tests', '~> 4.2'
  gem 'webrick'
  gem 'et_full_system_control', git: 'https://github.com/hmcts/et-full-system-control.git'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '~> 4.1'
  gem 'listen', '>= 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'capybara-screenshot', '~> 1.0'
  gem 'et_test_helpers', git: 'https://github.com/hmcts/et_test_helpers.git', tag: 'v1.3.2'
  gem 'rspec-rails', '~> 6.1'
  gem 'rspec_junit_formatter', '~> 0.6.0'
  gem 'site_prism', '~> 5.0'
  gem 'database_cleaner', '~> 2.0'
  gem 'webmock', '~> 3.11'
  gem 'faker', '~> 3.2'
  gem 'factory_bot', '~> 6.1'
end

group :production do
  # Add bootsnap for 5.2
  gem 'bootsnap', '~> 1.4'
end

group :assets do
  # Use SCSS for stylesheets
  # Use Uglifier as compressor for JavaScript assets
  gem 'uglifier', '>= 1.3.0'
  # See https://github.com/rails/execjs#readme for more supported runtimes
  # gem 'therubyracer', platforms: :ruby
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "sentry-ruby", "~> 5.9"
gem "sentry-rails", "~> 5.9"

gem 'et_azure_insights', '1.0.0', git: 'https://github.com/hmcts/et-azure-insights.git', tag: 'v1.0.0'
gem 'application_insights', git: 'https://github.com/microsoft/ApplicationInsights-Ruby.git', ref: '5db6b4'

gem 'et_gds_design_system', git:'https://github.com/hmcts/et_gds_design_system.git', tag: 'v7.0.1'
gem 'vite_rails', '~> 3.0.19'

gem "propshaft", "~> 1.1"
