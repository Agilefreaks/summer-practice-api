# frozen_string_literal: true

# auto_register: false

module Api
  class Validate
    class << self
      def call(step, options, args)
        step
          .operation
          .call(args.first)
          .to_monad
          .fmap { |attributes| map_attributes(options, attributes) }
      end

      def map_attributes(options, attributes)
        attributes_hash = attributes.to_h
        options.key?(:map_to) ? options[:map_to].new(attributes_hash) : attributes_hash
      end
    end
  end

  class StepAdapters < Dry::Transaction::StepAdapters
    register :validate, Validate
  end
end
