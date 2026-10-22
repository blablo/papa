FROM ruby:2.3.3

# Debian Jessie (the base of ruby:2.3.3) is EOL and has been removed from the
# live mirrors, so apt-get update 404s on deb.debian.org / security.debian.org.
# Repoint apt at archive.debian.org before updating:
#   - only "jessie main" survives on the archive (jessie-updates and the
#     separate security suite were never archived, so drop them)
#   - the archived Release file is past its expiry, so disable Valid-Until
#   - the archive signing key is expired, so [trusted=yes] + --force-yes let
#     apt install the (now unauthenticatable) packages
RUN set -eux; \
    echo 'deb [trusted=yes] http://archive.debian.org/debian jessie main' > /etc/apt/sources.list; \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/10no-check-valid-until; \
    apt-get -o Acquire::Check-Valid-Until=false update -qq; \
    apt-get install -y --force-yes build-essential libpq-dev git nodejs
RUN apt-get install -y --force-yes imagemagick libmagickcore-dev libmagickwand-dev
ENV PATH="/usr/lib/x86_64-linux-gnu/ImageMagick-6.8.9/bin-Q16:$PATH"
# rmagick >= 6 requires Ruby 3.2+, but this image is Ruby 2.3; pin to the last
# release that supports Ruby 2.x.
RUN gem install rmagick -v 2.16.0
RUN gem list
RUN mkdir /papa

COPY Gemfile Gemfile
#COPY Gemfile.lock Gemfile.lock
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
