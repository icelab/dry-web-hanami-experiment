MyApp::Container.boot :router, namespace: true do |container|
  init do
    require "snowflakes/router/endpoint_resolver"
  end

  start do
    resolver = Snowflakes::Router::EndpointResolver.new(container, "web.controllers")

    register "resolver", resolver
  end
end
