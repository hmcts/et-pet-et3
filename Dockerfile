FROM ministryofjustice/ruby:2.5.1

# Adding argument support for ping.json
ARG APPVERSION=unknown
ARG APP_BUILD_DATE=unknown
ARG APP_GIT_COMMIT=unknown
ARG APP_BUILD_TAG=unknown

# Setting up ping.json variables
ENV APPVERSION ${APPVERSION}
ENV APP_BUILD_DATE ${APP_BUILD_DATE}
ENV APP_GIT_COMMIT ${APP_GIT_COMMIT}
ENV APP_BUILD_TAG ${APP_BUILD_TAG}

# add official nodejs repo
RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
        echo 'deb https://deb.nodesource.com/node jessie main' > /etc/apt/sources.list.d/nodesource.list

# install runit and nodejs
RUN apt-get update && apt-get install -y runit nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && rm -fr *Release* *Sources* *Packages* && \
    truncate -s 0 /var/log/*log

# SSH proxy settings
ENV SSH_AUTH_SOCK /tmp/ssh-auth
ENV SSH_AUTH_PROXY_PORT 1234

RUN mkdir -p /usr/src/app
RUN bundle config --global without test:development
WORKDIR /usr/src/app

COPY . /usr/src/app
COPY ./vendor /usr/src/app/vendor

#ONBUILD 
COPY Gemfile /usr/src/app/
#ONBUILD 
COPY Gemfile.lock /usr/src/app/

# Hack to install private gems
#ONBUILD 
RUN socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork TCP4:$(ip route|awk '/default/ {print $3}'):$SSH_AUTH_PROXY_PORT & bundle install

#ONBUILD 
COPY . /usr/src/app
#ONBUILD 
RUN mkdir -p /usr/src/app/public/assets

RUN bundle install
RUN bundle exec rails assets:precompile RAILS_ENV=production SECRET_KEY_BASE=foobar
RUN bundle exec rake non_digest_assets RAILS_ENV=production SECRET_KEY_BASE=foobar

# Ensure the pdftk package is installed as a prereq for ruby PDF generation
ENV DEBIAN_FRONTEND noninteractive

EXPOSE 8080

CMD ["./run.sh"]
