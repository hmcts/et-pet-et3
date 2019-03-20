# Respond to an Employment Tribunal Claim
[![Build Status](https://travis-ci.org/ministryofjustice/et3.svg?branch=develop)](https://travis-ci.org/ministryofjustice/et3)

Digital ET3 form within the in-house ET microservice architecture, replacing a third party supplier. ET3 allows respondents to make a response to an ET1 claim.

## Getting Started
This is a Ruby on Rails app which uses [GOV.UK Elements](https://github.com/alphagov/govuk_elements) and sits within the ET service.
The form submits to the [ET API](https://github.com/ministryofjustice/et_api) which has been configured, via Docker, within the [ET Full System](https://github.com/ministryofjustice/et-full-system).
Running this app will enable development of the app itself, with its test suite mocking the final submission.

### Prerequisites
* Ruby 2.5.1 (we recommend using [RVM](https://rvm.io/))
* [Rails 5.2](https://rubygems.org/gems/rails)
* [Docker](https://docs.docker.com/install/) & [Docker Compose](https://docs.docker.com/compose/install/)
* [Node.js](https://nodejs.org/en/) & [NPM](https://www.npmjs.com/get-npm)
* [Google Chrome](https://www.google.com/chrome/) & [ChromeDriver](http://chromedriver.chromium.org/) (Default browser for test suite)

### Installing
1) Clone the repo
1) _[Optional]_ Install Google Chrome & ChromeDriver in order to run the test suite without further configuration later.
1) Install RVM (link above) and install Ruby 2.5.1
1) Install node.js and npm (links above)
1) Install Docker and Docker Compose (links above)
1) Change directory into the repo and run `bundle install` to install the gems
1) Copy `.env.example` and rename to `.env`
1) Run `./bin/dev/docker-support-services up`
1) Run `bundle exec rake parallel:create parallel:migrate`
1) Run `bundle exec rails db:create db:migrate`

## Running Tests

The suite for ET3 consists of unit, integration and feature tests, therefore requiring Chrome.
It also uses the [parallel_tests gem](https://github.com/grosser/parallel_tests) which utilises multiple threads for more efficient testing.

### Entire Suite in Parallel

Run `bundle exec rake parallel:spec`

### Entire Suite via RSpec

Run `bundle exec rspec`

### Other Tests via RSpec

Tests are separated by directories within the `/spec/` folder.

Run `bundle exec rspec spec/<directory name>` to run all specs within a directory.

Run `bundle exec rspec spec/<directory name>/<spec_name>_spec.rb` to run an individual spec.

## Deployment

This app is essentially a frontend microservice and should not be deployed by itself.
To test ET3 in full, including RTF upload and form submission, use the [ET Full System](https://github.com/ministryofjustice/et-full-system).
Before running the full system ensure ET3 is set to the branch or commit you wish to test.
Please see the README for further details.

## Environment Variables

### DB_PORT

Used to specify the database port.
 
For example, used within the docker-compose configuration.

### S3_PORT

Used to specify the minio port.
 
For example, used within the docker-compose configuration.

### AZURE_STORAGE_BLOB_PORT

Used to specify the azurite port.

For example, used within the docker-compose configuration.

### AWS_ACCESS_KEY_ID

Used as an identifier to log into the minio portal.

### AWS_SECRET_ACCESS_KEY

Used as a password to log into the minio portal.

### AWS_REGION

Used to specify the AWS region for minio.

For example, used to configure the bucket setup in minio.

### S3_DIRECT_UPLOAD_BUCKET

Used to specify the AWS bucket name for minio.

For example, used to configure the bucket setup in minio.

### AWS_ENDPOINT

Used as the S3 endpoint, often taking in the `S3_PORT` as a parameter.

For example, used to configure the bucket setup in minio.

### AWS_S3_FORCE_PATH_STYLE

Used as a boolean for the `force_path_style` option. 

For example and further info, see [AWS Docs](https://docs.aws.amazon.com/sdkforruby/api/Aws/S3/Client.html).

### SELENIUM_PORT

Used to expose Selenium to a viewer.

For example, used in conjunction with Zalenium to take a video of tests being run.

### AZURE_STORAGE_BLOB_HOST

Used as the Azure endpoint, often taking in the `AZURE_STORAGE_BLOB_PORT` as a parameter.

For example, used to configure the container setup in azurite.
