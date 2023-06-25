SHARED_DIR = Pathname(__FILE__).dirname.join('../../shared')
require SHARED_DIR.join('route_helpers.rb')

module Helpers
  def route_for(name, args = nil, filter = nil)
    "#{ENV['HOST_URL']}#{route_helpers.route_for(name, args, filter)}"
  end

  def render_json_file(name, args={})
    JSON.pretty_generate(route_helpers.format_json_file(name, args.merge(host: ENV['HOST_URL'])))
  end

  private

  def route_helpers
    @route_helpers ||= RouteHelpers.new
  end
end
