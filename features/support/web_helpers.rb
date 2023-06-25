# frozen_string_literal: true

require SHARED_DIR.join('route_helpers.rb')

module WebHelpers
  module_function

  def app
    Rack::Lint.new(Api::Web.app)
  end

  def parsed_body
    JSON.parse(last_response.body)
  rescue JSON::ParserError
    {}
  end

  def route_helpers
    @route_helpers ||= RouteHelpers.new
  end

  def settings
    Api::Container['settings']
  end
end
