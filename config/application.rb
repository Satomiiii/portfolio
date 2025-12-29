require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # lib ディレクトリをオートロードとイーガーロードの対象に追加
    config.autoload_paths += %W(#{config.root}/lib)
    config.eager_load_paths += %W(#{config.root}/lib)

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.

    # タイムゾーンの設定 (必要なら変更)
    # config.time_zone = "Central Time (US & Canada)"

    # 追加のパスをイーガーロードの対象にする (必要に応じて変更)
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
