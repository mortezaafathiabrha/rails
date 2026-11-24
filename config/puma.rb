port = ENV.fetch("PORT", "3000")
environment ENV.fetch("RAILS_ENV", "production")

bind "tcp://0.0.0.0:#{port}"
threads 1, ENV.fetch("RAILS_MAX_THREADS", "5").to_i
