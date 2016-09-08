#!/bin/bash --login
cd /var/www/cityvoice/code
source ~/secret_token_env.sh
rvm use ruby-2.1.7
bundle install --deployment --without development test
bundle exec rake tmp:cache:clear
bundle exec rake assets:clobber RAILS_ENV="production"
bundle exec rake assets:precompile RAILS_ENV="production"