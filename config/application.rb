require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TheUltrasNewsRoomJan2019
  class Application < Rails::Application
      config.load_defaults 5.2
      config.generators do |generate|
      generate.helper false
      generate.assets false
      generate.view_specs false
      generate.helper_specs false
      generate.routing_specs false
      generate.controller_specs false
      generate.system_tests false
    end
    config.stripe.secret_key = 'sk_test_eo7seUy2UzwSpPXq2q7341vP00g3k2fSTA'
    config.stripe.publishable_key = 'pk_test_zARpoHaZOl2LQLtr0YOthxBm0097GcQG8Q'
    config.stripe.endpoint = '/payment/stripe-integration'
    config.i18n.available_locales = [:sv, :en]
    config.i18n.default_locale = :en
    config.generators.system_tests = nil

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', 
          headers: :any, 
          methods: %i[get post put delete],
          expose: %w(access-token expiry token-type uid client),
          max_age: 0
      end
    end
  end
end
