# Respond to an Employment Tribunal Claim
[![Build Status](https://travis-ci.org/ministryofjustice/et3.svg?branch=develop)](https://travis-ci.org/ministryofjustice/et3)
 
[![Build Status](https://dev.azure.com/HMCTS-PET/pet-azure-infrastructure/_apis/build/status/et3?branchName=develop)](https://dev.azure.com/HMCTS-PET/pet-azure-infrastructure/_build/latest?definitionId=19&branchName=develop)

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

### Developing And Testing Using The et_full_system gem

Please refer to https://github.com/hmcts/et_full_system_gem for instructions on general use and starting an environment.
Once you have an environment running, read on below ...

#### Developing Locally In Full System

The easiest way to develop is to use the full system to provide everything that you need (database, API etc..)
and use a special command to redirect the full system admin URL to your local machine.
The command to redirect to your local machine on port 3000 is (note you can use any free port) :-

```
et_full_system docker local_et3 3000
```

Then, in this project directory run

```
et_full_system docker et3_env > .env
```

which will setup all environment variables to the correct values to work in the full system environment.

then run

```

rails s

```

which will run the web server.  The url is

http://et3.et.127.0.0.1.nip.io:3100


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


## Shuttering

In order to stop people using the system a maintenance page has been added which is controlled using environment
variables.

These are :-

MAINTENANCE_ENABLED - Set to 'true' to enable maintenance page to be enabled

Any of the environment variables below can be added if you want to customize from the defaults

MAINTENANCE_ALLOWED_IPS
MAINTENANCE_END - If added you will see "You will be able to use the service from " followed by this text

## Environment Variables

### DB_PORT

Used to specify the database port.
 
For example, used within the docker-compose configuration.

### AZURE_STORAGE_BLOB_PORT

Used to specify the azurite port.

For example, used within the docker-compose configuration.

### SELENIUM_PORT

Used to expose Selenium to a viewer.

For example, used in conjunction with Zalenium to take a video of tests being run.

### AZURE_STORAGE_BLOB_HOST

Used as the Azure endpoint, often taking in the `AZURE_STORAGE_BLOB_PORT` as a parameter.

For example, used to configure the container setup in azurite.
