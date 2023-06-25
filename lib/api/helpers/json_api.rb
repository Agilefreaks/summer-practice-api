# frozen_string_literal: true

module Api
  module Helpers
    module JsonApi
      #:reek:UtilityFunction
      def prepare_attribute(errors)
        attribute = ''
        errors.path.each { |error| attribute += "#{error}/" unless error.is_a? Integer }
        attribute.chop
      end

      #:reek:UtilityFunction
      def jsonapi_error(attribute, message)
        {
          title: 'Invalid attribute',
          status: Rack::Utils.status_code(:unprocessable_entity).to_s,
          source: { pointer: "/data/attributes/#{attribute}" },
          detail: message.is_a?(Array) ? message.join : message
        }
      end
    end
  end
end
