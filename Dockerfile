FROM ruby:2.7.0

RUN apt-get update -qq && \
    apt-get install -y build-essential \
    libffi-dev tzdata postgresql-client nodejs yarn && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man

RUN gem update --system 3.2.3
RUN gem install bundler -v '2.4.22'

WORKDIR /app

ENV RAILS_LOG_STDOUT="1" \
    RAILS_SERVE_STATIC_FILES="true" \
    RAILS_ENV="production" \
    BUNDLE_WITHOUT="development"

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

# COPY docker-entrypoint /usr/bin/

RUN chmod +x bin/docker-entrypoint.sh


# RUN bundle exec bootsnap precompile --gemfile app/ lib/

# RUN SECRET_KEY_BASE_DUMMY=1 bundle exec rails assets:precompile

# ENTRYPOINT ["/rails/bin/docker-entrypoint"]
ENTRYPOINT ["./bin/docker-entrypoint.sh"]

EXPOSE 3000
# CMD ["bash", "-c", "/usr/bin/wait-for-it.sh db:5432 -- rm -f tmp/pids/server.pid && bundle exec rails db:drop db:create db:migrate db:seed && bundle exec rails s -b '0.0.0.0'"]
CMD ["bash", "-c", "db:5432 -- rm -f tmp/pids/server.pid"]
CMD ["bash", "-c", "rm -f tmp/pids/server.pid && RAILS_ENV=development bin/rails s  -b '0.0.0.0'"]