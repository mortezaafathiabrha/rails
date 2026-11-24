require "action_controller/railtie"

# A single-file Rails application: one route and one controller.
class HelloWorldApp < Rails::Application
  config.root = __dir__
  config.eager_load = false
  config.consider_all_requests_local = false
  config.secret_key_base = ENV.fetch("SECRET_KEY_BASE", "hello-world-rails-secret-key-base-change-me")
  config.logger = Logger.new($stdout)
  config.log_level = :info
  config.hosts.clear

  routes.append do
    root to: "hello#index"
  end
end

class HelloController < ActionController::Base
  def index
    render html: <<~HTML.html_safe
      <!DOCTYPE html>
      <html>
      <head>
        <title>Hello World - Rails</title>
        <style>
          body { font-family: Arial, sans-serif; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; background: linear-gradient(135deg, #cc0000 0%, #7a0000 100%); }
          .container { text-align: center; color: white; }
          h1 { font-size: 3em; margin: 0; }
          p { font-size: 1.2em; margin-top: 10px; }
        </style>
      </head>
      <body>
        <div class="container">
          <h1>Hello World!</h1>
          <p>Welcome to Rails #{Rails.version}</p>
        </div>
      </body>
      </html>
    HTML
  end
end

HelloWorldApp.initialize!

run HelloWorldApp
