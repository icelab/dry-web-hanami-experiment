require "hanami/router"
require "hanami/controller"

module MyApp
  module Web
    class Application
      # TODO: do I need to pass the whole container here, or just the endpoint
      # resolver? Maybe I might want to use other things from the container by the
      # time this becomes a fully fledged web frontend?
      #
      # Or perhaps the container should be _configured_ here?
      def initialize(container)
        # It might be good if we made this a configurable, bootable component
        configuration = Hanami::Controller::Configuration.new

        routes = Hanami::Router.new(
          resolver: container["router.resolver"],
          configuration: configuration,
        ) do
          # TODO: load route definitions from an external file
          root to: "home"
        end

        @app = Rack::Builder.new do
          use Rack::Lint
          run routes
        end.to_app.freeze

        freeze
      end

      def call(env)
        @app.call(env)
      end
    end
  end
end
