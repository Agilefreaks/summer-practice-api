# frozen_string_literal: true

require_relative '../shared/route_helpers'

module UrlHelpers
  class << self
    def route_for(name, args = nil, filter = nil)
      "#{settings.host_url}#{route_helpers.route_for(name, args, filter)}"
    end

    def settings
      Api::Container['settings']
    end

    def route_helpers
      @route_helpers ||= RouteHelpers.new
    end
  end
end
