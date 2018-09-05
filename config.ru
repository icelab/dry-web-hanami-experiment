require_relative "system/boot"
require "my_app/web/application"

run MyApp::Web::Application.new(MyApp::Container)
