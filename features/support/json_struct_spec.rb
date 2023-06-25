# frozen_string_literal: true

require 'rspec'

module JSONStructSpec
  module Matchers
    module_function

    def match_json_structure(expected_json)
      MatchStructure.new(expected_json)
    end

    class MatchStructure
      attr_reader :expected, :actual, :failure_message

      def initialize(expected_json)
        @expected = JSON.pretty_generate(MatchStructure.dump_structure(JSON.parse(expected_json)))
      end

      def matches?(actual_json)
        JSON.parse(actual_json).tap do |hash|
          @actual = JSON.pretty_generate(MatchStructure.dump_structure(hash))
        end

        actual == @expected || fail_gracefully
      end

      def failure_message_when_negated
        'does not support negation'
      end

      def diffable?
        true
      end

      private

      class << self
        #:reek:TooManyStatements
        def dump_structure(hash)
          hash.transform_values do |value|
            case value
            when Hash
              dump_structure(value)
            when Array
              value.filter { |item| item.is_a?(Hash) }.map { |item| dump_structure(item) }
            else
              value.class.to_s
            end
          end
        end
      end

      def fail_gracefully
        explain

        false
      end

      def explain
        @failure_message = "JSON structures don't match.\n"
      end
    end
  end
end
