FROM ministryofjustice/ruby:2.5.1-webapp-onbuild

# Ensure the pdftk package is installed as a prereq for ruby PDF generation
ENV DEBIAN_FRONTEND noninteractive

EXPOSE 8080

RUN bundle exec rails assets:precompile RAILS_ENV=production SECRET_KEY_BASE=foobar
RUN bundle exec rake non_digest_assets RAILS_ENV=production SECRET_KEY_BASE=foobar

RUN wget https://github.com/papertrail/remote_syslog2/releases/download/v0.20/remote-syslog2_0.20_amd64.deb
RUN dpkg -i remote-syslog2_0.20_amd64.deb

CMD ["./run.sh"]
