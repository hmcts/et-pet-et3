FROM ministryofjustice/ruby:2.3.3-webapp-onbuild

# Ensure the pdftk package is installed as a prereq for ruby PDF generation
ENV DEBIAN_FRONTEND noninteractive


RUN npm install

EXPOSE 8080

RUN bundle exec rails assets:precompile RAILS_ENV=production SECRET_KEY_BASE=foobar
RUN bundle exec rake non_digest_assets RAILS_ENV=production SECRET_KEY_BASE=foobar

RUN curl https://s3.amazonaws.com/aws-cloudwatch/downloads/latest/awslogs-agent-setup.py -O
RUN mkdir /etc/cron.d
RUN touch /etc/cron.d/awslogs

CMD ["./run.sh"]
