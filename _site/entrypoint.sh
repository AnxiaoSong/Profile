#!/bin/bash
set -e
cd /site

# Host Gemfile.lock is for Windows; regenerate for Linux
rm -f Gemfile.lock
bundle install --quiet

exec bundle exec jekyll serve --host 0.0.0.0 --livereload --force_polling
