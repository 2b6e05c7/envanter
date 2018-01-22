require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)
module Envanter
  class Application < Rails::Application
    config.load_defaults 5.1
    config.i18n.fallbacks = true
    config.i18n.default_locale = 'en'
    WillPaginate.per_page = 10
  end
end
