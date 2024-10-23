require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Karipic
  class Application < Rails::Application
    config.active_storage.variant_processor = :mini_magick
    config.load_defaults 7.2
    # config.autoload_paths += %W(#{config.root}/lib)
  end
end
