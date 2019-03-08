FROM ruby:2.1.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev git nodejs
RUN apt-get install -y imagemagick libmagickcore-dev libmagickwand-dev
ENV PATH="/usr/lib/x86_64-linux-gnu/ImageMagick-6.8.9/bin-Q16:$PATH"
RUN gem install rmagick
RUN gem list
RUN mkdir /papa

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

COPY . /papa
WORKDIR /papa

RUN mkdir -p /tmp/sockets
RUN mkdir -p /tmp/pids
RUN touch /tmp/sockets/puma.sock
RUN touch /tmp/pids/puma.pid

RUN chmod 755 /papa/run.sh

EXPOSE 3000

CMD /papa/run.sh
