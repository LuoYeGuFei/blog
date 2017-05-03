require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.generators do |generator|
      generator.helper false
      generator.assets false
      generator.view_specs false
      generator.test_framework false
      generator.sikp_routes true  # 跳过路由的自动设置
    end
  end
end
