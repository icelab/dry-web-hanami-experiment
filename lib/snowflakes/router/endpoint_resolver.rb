# This is for the NotCallableEndpointError. It would be good if this could be
# require-able without having to bring in all the routing files
require "hanami/routing"
require "hanami/controller"

module Snowflakes
  module Router
    class EndpointResolver
      attr_reader :container
      attr_reader :base_namespace

      def initialize(container, base_namespace = nil)
        @container = container
        @base_namespace = base_namespace
      end

      def call(name, namespace = nil, configuration = nil)
        endpoint =
          case name
          when String
            resolve_string_identifier(name, namespace, configuration)
          when Class
            name.respond_to?(:call) ? name : name.new
          else
            name
          end

        raise Hanami::Routing::NotCallableEndpointError.new(endpoint) unless endpoint.respond_to?(:call)

        endpoint
      end

      private

      def resolve_string_identifier(name, namespace, configuration)
        identifier = [base_namespace, namespace, name].compact.join(".")

        container[identifier].yield_self { |endpoint|
          if endpoint.class < Hanami::Action
            endpoint.with(configuration: configuration)
          else
            endpoint
          end
        }
      end
    end
  end
end
