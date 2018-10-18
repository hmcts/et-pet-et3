# Respond to an Employment Tribunal Claim
[![Build Status](https://travis-ci.org/ministryofjustice/et3.svg?branch=develop)](https://travis-ci.org/ministryofjustice/et3)

Digital ET3 form within the in-house ET service, replacing a third party supplier.

## Getting Started
This is a Ruby on Rails app which uses [GOV.UK Elements](https://github.com/alphagov/govuk_elements) and sits within the ET service.
The form submits to the [ET API](https://github.com/ministryofjustice/et_api) which has been configured, via Docker, within the [ET Full System](https://github.com/ministryofjustice/et-full-system).
Running this app will enable development of the app itself, with its test suite mocking the final submission.

### Prerequisites
* Ruby 2.5.1 (we recommend using [RVM](https://rvm.io/))
* [Rails 5.2](https://rubygems.org/gems/rails)
* [Docker](https://docs.docker.com/install/) & [Docker Compose](https://docs.docker.com/compose/install/)
* [NPM](https://www.npmjs.com/get-npm)
* [Google Chrome](https://www.google.com/chrome/) (Default browser for test suite)

### Installing
1) Clone the repo
1) _[Optional]_ Install Google Chrome in order to run the test suite without further configuration later.
1) Install RVM (link above) and install Ruby 2.5.1
1) Install npm (link above)
1) Install Docker and Docker Compose (links above)
1) Change directory into the repo and run `bundle install` to install the gems
1) Copy `.env.example` and rename to `.env`
1) Run `./bin/dev/docker-support-services up`
1) Run `RAILS_ENV=development bundle exec rake parallel:create parallel:migrate`
1) Run `RAILS_ENV=test bundle exec rake parallel:create parallel:migrate`

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
