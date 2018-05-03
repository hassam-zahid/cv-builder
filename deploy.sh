git pull
bundle install
bundle exec rake db:migrate RAILS_ENV=production
bundle exec rake db:seed RAILS_ENV=production
RAILS_ENV=production bundle exec rake assets:precompile
sudo service nginx restart