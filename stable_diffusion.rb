require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{ENV['REDIS_HOST']}:#{ENV['REDIS_PORT']}" }
end
Sidekiq.configure_server do |config|
  config.redis = { url: "redis://#{ENV['REDIS_HOST']}:#{ENV['REDIS_PORT']}" }
end

class StableDiffusion
  include Sidekiq::Job

  EXECUTABLE = ENV["EXECUTABLE"] || "python"

  def perform(text)
    system EXECUTABLE,
      "scripts/txt2img.py",
      "--prompt #{text}",
      "--plms",
      "--n_samples 1"
  end
end
