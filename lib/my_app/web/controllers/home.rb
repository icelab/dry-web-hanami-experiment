require "hanami/controller"

module MyApp
  module Web
    module Controllers
      class Home < Hanami::Action
        # Allow actions to be created via `.new`, without any arguments.
        # Important for resolution from our container.
        #
        # Perhaps this configuration could be set in a bootable component and
        # then auto-injected... e.g.
        #
        # include Import["web.controller.configuratiion"]
        #
        # Either way, in a regular app, this would go into a shared superclass.
        def self.new(configuration: Hanami::Controller::Configuration.new)
          super(configuration: configuration)
        end

        # This would go into a superclass too.
        def with(configuration:)
          self.class.new(configuration: configuration)
        end

        def call(_req, res)
          res.body = "Hello world"
        end
      end
    end
  end
end
