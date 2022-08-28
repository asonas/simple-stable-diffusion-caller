web: bundle exec rackup -p $PORT --host 0.0.0.0
worker: bundle exec sidekiq -r ./stable_diffusion.rb -C sidekiq.yml
