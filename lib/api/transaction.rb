# frozen_string_literal: true

# auto_register: false

require 'dry/transaction'
require 'dry-validation'

require 'api/import'
require_relative 'step_adapters'

module Api
  class Transaction
    def self.inherited(subclass)
      super
      subclass.include Dry::Transaction(container: Api::Container, step_adapters: StepAdapters)
      subclass.include Dry::Matcher.for(:call, with: Dry::Matcher::ResultMatcher)

      Dry::Validation.load_extensions(:monads)
    end
  end

  module Filtering
    extend ActiveSupport::Concern

    included do
      map :map_filter_attributes

      def map_filter_attributes(params = {})
        params.merge(filter_attributes: self.class.filter_attributes(params))
      end

      class << self
        def filter_attributes(params)
          (params.deep_symbolize_keys[:filter] || {}).keys
        end
      end
    end
  end
end
