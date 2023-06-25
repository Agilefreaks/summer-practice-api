# frozen_string_literal: true

require 'dry/web/roda/application'
require 'dry/effects'
require 'api/import'

require_relative 'container'

module Api
  class Web < Dry::Web::Roda::Application
    include Dry::Effects::Handler.Reader(:response)
    include Dry::Effects::Handler.Reader(:request_params)

    configure do |config|
      config.container = Container
      config.routes = 'web/routes'
    end

    opts[:root] = Pathname(__FILE__).join('../..').realpath.dirname

    plugin :json, content_type: 'application/vnd.api+json'
    plugin :json_parser, content_type: 'application/vnd.api+json'
    plugin :static, %w[/api/docs /templates]
    plugin :error_handler
    plugin :symbol_status
    plugin :multi_route
    plugin :route_list
    plugin :all_verbs
    plugin :streaming
    plugin :hooks
    plugin :default_headers,
           'Content-Type' => 'application/vnd.api+json'

    route do |route|
      route.multi_route

      route.root do
        route.redirect '/api/docs/index.html'
      end
    rescue Api::Errors::ServiceUnavailableError
      halt_request(:service_unavailable)
    end

    error do |error|
      self.class[:rack_monitor].instrument(:error, exception: error)
      raise error
    end

    def resolve(route, controller, &block)
      result = ''

      with_request_params(route.params) do
        with_response(response) do
          result = get_result(route, controller, &block)
        end
      end

      result
    end

    load_routes!

    private

    class << self
      def locale(route)
        params = route.params

        params['locale'] if params
      end

      def resolve_language(route)
        I18n.locale = locale(route)
      rescue I18n::InvalidLocale
        I18n.locale = I18n.default_locale
      end
    end

    def get_result(route, controller, &block)
      self.class.resolve_language(route)
      route.resolve controller, &block
    end

    def halt_request(status)
      response.status = status
      request.halt
    end
  end
end
