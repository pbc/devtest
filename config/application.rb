require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ZappistoreDevTest
  class Application < Rails::Application
    config.autoload_paths += %W(#{Rails.root}/app/services/**)
    config.autoload_paths += %W(#{Rails.root}/app/price_calculation/**)
  end
end
