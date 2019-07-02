FROM employmenttribunal.azurecr.io/ruby26-onbuild:0.1

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

# fix to address http://tzinfo.github.io/datasourcenotfound - ET ONLY
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -q && \
    apt-get install -qy tzdata --no-install-recommends && apt-get clean && \
    rm -rf /var/lib/apt/lists/* && rm -fr *Release* *Sources* *Packages* && \
    truncate -s 0 /var/log/*log

RUN bash -c "bundle exec rails assets:precompile RAILS_ENV=production SECRET_KEY_BASE=foobar"
RUN bash -c "bundle exec rake non_digest_assets RAILS_ENV=production SECRET_KEY_BASE=foobar"

EXPOSE 8080

# running app as a servive
RUN mkdir /etc/service/app
COPY run.sh /etc/service/app/run
RUN chmod +x /etc/service/app/run
