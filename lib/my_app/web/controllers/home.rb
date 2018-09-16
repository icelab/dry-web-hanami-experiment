require "my_app/web/controller"
require "my_app/import"

module MyApp
  module Web
    module Controllers
      class Home < Controller
        include Import[view: "web.views.home"]

        def call(_req, res)
          res.body = view.()
        end
      end
    end
  end
end
