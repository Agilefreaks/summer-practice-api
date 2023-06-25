# frozen_string_literal: true

require 'json'

class RouteHelpers
  attr_reader :route_list_names

  def initialize
    file_path = Pathname(__FILE__).dirname.join('../routes.json')
    load_file(file_path)
  end

  def route_for(name, args = nil, query_params = nil)
    unless path = @route_list_names[name]
      raise StandardError, "no route exists with the name: #{name.inspect}"
    end

    if args
      if args.is_a?(Hash)
        range = 1..-1
        path = path.gsub(%r{:[^/]+}) do |match|
          unless value = args[match[range].to_sym]
            raise StandardError, "no matching value exists in the hash for named route #{name}: #{match}"
          end

          value
        end
      else
        values = args.dup
        path = path.gsub(%r{:[^/]+}) do |match|
          raise StandardError, "not enough placeholder values provided for named route #{name}: #{match}" if values.empty?

          values.shift
        end

        raise StandardError, "too many placeholder values provided for named route #{name}" unless values.empty?
      end
    end

    path = [path, '?', query_params.to_query].join if query_params

    path
  end

  def format_json_file(name, args = {})
    json_file = SHARED_DIR.join(name)
    json_file_content = File.read(json_file)

    content = args.empty? ? json_file_content : format_content(json_file_content, args)
    JSON.parse(content)
  end

  private

  def format_content(content, args)
    matchers = args.keys.join('|')
    result = content
                 .gsub(/"{(#{matchers})}:non-string"/, '{\1}')
                 .gsub(/{(#{matchers})}/, '%{\1}')

    format(result, args)
  end

  def load_file(file_path)
    @route_list_names = {}

    routes = JSON.parse(File.read(file_path))
    @route_list = routes.map do |r|
      path = r['path'].freeze
      route = { path: path }

      if methods = r['methods']
        route[:methods] = methods.map(&:to_sym)
      end

      if name = r['name']
        name = name.to_sym
        route[:name] = name.to_sym
        @route_list_names[name] = path
      end

      route.freeze
    end.freeze

    @route_list_names.freeze
  end
end
