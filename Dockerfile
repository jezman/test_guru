FROM ruby:2.5.1-alpine

RUN apk update && apk add \
   build-base \
   nodejs \
   postgresql-dev \
   tzdata \
&& rm -rf /var/lib/apt/lists/*

ENV app_path /app

RUN mkdir ${app_path}
WORKDIR ${app_path}
COPY Gemfile Gemfile.lock ${app_path}/
RUN bundle install
COPY . ${app_path}

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]

