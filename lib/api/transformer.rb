# frozen_string_literal: true

# auto_register: false

require 'dry/transformer'

module Api
  class Transformer < Dry::Transformer::Pipe
    def self.new(input)
      super().call(input)
    end
  end
end
