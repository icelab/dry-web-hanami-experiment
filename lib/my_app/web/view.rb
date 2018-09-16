# auto_register: false

require "dry/view/controller"
require "my_app/container"

module MyApp
  module Web
    class View < Dry::View::Controller
      configure do |config|
        config.paths = [Container.root.join("web/templates")]
        config.layout = "application"
      end
    end
  end
end
