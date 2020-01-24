source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.1'
# Azure deployment so we need this
gem 'azure_env_secrets', git: 'https://github.com/ministryofjustice/azure_env_secrets.git', tag: 'v0.1.3'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 6.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.9'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'sprockets', '~> 3.7', '>= 3.7.2'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'slim-rails', '~> 3.2'
gem 'govuk_template', '~> 0.26.0'
gem 'govuk_elements_rails', '~> 3.1'
gem 'govuk_elements_form_builder',  '~>1.3'
gem 'gov_uk_date_fields', '~> 2.1'
gem 'jquery-rails', '~> 4.3'
gem 'activerecord-nulldb-adapter', '~> 0.4'
gem 'httparty', '~> 0.17'
gem 'uk_postcode', '~> 2.1'
# Add .env file to store environment variables
gem 'dotenv-rails', '~> 2.7'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 3.21'
  gem 'selenium-webdriver', '~> 3.142'
  gem 'rubocop', '~> 0.74'
  gem 'rubocop-rspec', '~> 1.33'
  gem 'simplecov', '~> 0.15'
  gem 'pry', '~> 0.12'
  # Run Rspec tests in parallel to speed the test suite up
  gem 'parallel_tests', '~> 2.29'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara-screenshot', '~> 1.0'
  gem 'rspec-rails', '~> 3.8'
  gem 'site_prism', '~> 3.2'
  gem 'webdrivers', '~> 4.0'
  gem 'database_cleaner', '~> 1.5'
  gem 'webmock', '~> 3.5'
  gem 'faker', '~> 2.3'
  gem 'azure-storage', '~> 0.15.0.preview'
  gem 'factory_bot'
end

group :production do
  # Add bootsnap for 5.2
  gem 'bootsnap', '~> 1.4'
  gem 'iodine', '~> 0.7.34'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'sentry-raven', '~> 2.12'

gem 'et_dropzone_uploader', git: 'https://github.com/hmcts/et_dropzone_uploader.git', tag: 'v2.2.3'
