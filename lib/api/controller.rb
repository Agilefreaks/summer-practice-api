# frozen_string_literal: true

require 'api/import'
require 'dry/effects'
require 'dry-validation'
require 'api/helpers/json_api'

module Api
  class Controller
    include Dry::Effects.Reader(:response)
    include Dry::Effects.Reader(:request_params)
    include Api::Import[:logger]
    include Helpers::JsonApi

    protected

    def serialize_response(serializer, data, options = {})
      options[:include] = includes.split(',') if includes
      options[:params] = { request_params: request_params }
      [serializer.new(data, options).serializable_hash.to_json, options[:status] || :ok]
    rescue ArgumentError
      [nil, :unprocessable_entity]
    end

    def build_response(content, status: :ok, headers: {})
      response.status = status
      response.headers.merge!({
        "Content-Language": I18n.locale.to_s
      }.merge(headers).deep_stringify_keys!)
      content
    end

    def handle(monad)
      monad.failure { |error| render_failure(error) }
    end

    def render_not_found
      response.status = :not_found
      nil
    end

    def render_no_content
      response.status = :no_content
      nil
    end

    def render_forbidden
      response.status = :forbidden
      nil
    end

    def render_unauthorized
      response.status = :unauthorized
      nil
    end

    def render_conflict
      response.status = :conflict
      nil
    end

    def render_status_code(status_code)
      errors = {
        forbidden: :render_forbidden,
        not_found: :render_not_found,
        unauthorized: :render_unauthorized,
        conflict: :render_conflict
      }

      send(errors[status_code])
    end

    private

    class << self
      def parse_filter_params(hash)
        hash ? hash.each { |key, value| hash[key] = value.split(',') } : {}
      end
    end

    def includes
      request_params['include'] if request_params
    end

    def render_failure(error)
      case error
      when Symbol then render_status_code(error)
      when Dry::Validation::Result then render_validation_error(error)
      when ROM::TupleCountMismatchError then render_not_found
      else render_server_error(error)
      end
    end

    def render_server_error(error, status: :internal_server_error)
      p error
      logger.error(error)
      response.status = status
      nil
    end

    def render_validation_error(validation_result)
      response.status = :unprocessable_entity
      result = validation_result
               .errors
               .map { |error| jsonapi_error(prepare_attribute(error), error.text) }

      { errors: result }.to_json
    end
  end
end
