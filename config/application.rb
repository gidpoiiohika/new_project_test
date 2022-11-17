require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module NewProjectTestIndex
  class Application < Rails::Application
    config.load_defaults 7.0
    config.active_job.queue_adapter = :sidekiq
    config.api_only = true
    config.session_store :cookie_store, key: '_interslice_session'
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use config.session_store, config.session_options
    config.active_record.use_yaml_unsafe_load = true
  end
end
