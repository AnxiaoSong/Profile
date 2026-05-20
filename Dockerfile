FROM ruby:2.7-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /site

COPY Gemfile Gemfile.lock ./
RUN rm -f Gemfile.lock && \
    gem install bundler:2.3.24 && \
    bundle install

EXPOSE 4000
EXPOSE 35729

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

CMD ["/usr/local/bin/entrypoint.sh"]
