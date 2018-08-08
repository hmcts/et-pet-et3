#!/bin/bash

case ${DOCKER_STATE} in
migrate)
    echo "Running migrate"
    bundle exec rake db:migrate
    ;;
create)
    echo "Running create"
    bundle exec rake db:create
    bundle exec rake db:migrate
    bundle exec rake db:seed
    ;;
esac

echo "Running remote-syslog"

remote_syslog -p 20568 -d logs7.papertrailapp.com --pid-file=/var/run/remote_syslog.pid --hostname=$PAPERTRAIL_NAME /usr/src/app/log/production.log

echo "Running app"

bundle exec unicorn -p 8080 -c ./config/unicorn.rb -E production
