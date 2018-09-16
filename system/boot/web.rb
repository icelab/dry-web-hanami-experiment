MyApp::Container.boot :web, namespace: true  do |container|
  start do
    register "controller.configuration", Hanami::Controller::Configuration.new
  end
end
