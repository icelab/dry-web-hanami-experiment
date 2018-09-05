require "dry/web/container"
# require "hanami/controller"

module MyApp
  class Container < Dry::Web::Container
    configure do |config|
      config.name = :core
      config.default_namespace = "my_app"
      config.auto_register = ["lib/my_app"]
    end

    load_paths! "lib"
  end
end
