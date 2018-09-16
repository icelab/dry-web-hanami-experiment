require "my_app/web/view"

module MyApp
  module Web
    module Views
      class Home < View
        configure do |config|
          config.template = "home"
        end
      end
    end
  end
end
