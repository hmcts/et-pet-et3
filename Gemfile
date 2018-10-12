source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
gem 'unicorn'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'rack-proxy', '~> 0.6.4'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'slim-rails', '~> 3.1'
gem 'govuk_template', '~> 0.23.0'
gem 'govuk_elements_rails', '~> 3.1'
gem 'govuk_elements_form_builder',  '~>1.2'
gem 'gov_uk_date_fields', '~> 2.1'
gem 'jquery-rails', '~> 4.3'
gem 'activerecord-nulldb-adapter', '~> 0.3'
gem 'httparty', '~> 0.16'
gem 'uk_postcode', '~> 2.1'
gem 'dropzonejs-rails', '~> 0.8'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver', '~> 3.10'
  gem 'rubocop', '~> 0.52.1'
  gem 'rubocop-rspec', '~> 1.22'
  gem 'simplecov', '~> 0.15'
  gem 'pry', '~> 0.11'
  #VSCode debugger
  gem 'ruby-debug-ide', '~> 0.6.1'
  gem 'debase', '~> 0.2.2'
  # Run Rspec tests in parallel to speed the test suite up
  gem 'parallel_tests', '~> 2.22'
  # Add .env file to store environment variables
  gem 'dotenv-rails', '~> 2.5'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'cucumber-rails', '~> 1.5', :require => false
  gem 'capybara-screenshot', '~> 1.0'
  gem 'rspec-rails', '~> 3.7'
  gem 'site_prism', '~> 2.9'
  gem 'chromedriver-helper', '~> 1.1'
  gem 'geckodriver-helper', '~> 0.0'
  gem 'database_cleaner', '~> 1.5'
  gem 'webmock', '~> 3.3'
  gem 'faker', '~> 1.8'
  gem 'aws-sdk-s3', '~> 1.21'
end

group :production do
  # Add bootsnap for 5.2
  gem 'bootsnap', '~> 1.3'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'sentry-raven', '~> 2.7', '>= 2.7.4'
