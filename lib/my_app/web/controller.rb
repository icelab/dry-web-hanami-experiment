# auto_register: false

require "hanami/controller"
require "my_app/import"

module MyApp
  module Web
    class Controller < Hanami::Action
      include Import["web.controller.configuration"]

      def with(configuration:)
        self.class.new(configuration: configuration)
      end
    end
  end
end
