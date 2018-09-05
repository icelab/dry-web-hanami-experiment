begin
  require "byebug"
rescue LoadError # rubocop:disable Lint/HandleExceptions
end

require_relative "my_app/container"

container = MyApp::Container
container.finalize!
