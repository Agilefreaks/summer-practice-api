# frozen_string_literal: true

# auto_register: false

require_relative '../types'

module Api
  module Users
    module Entities
      class User < Dry::Struct
        attribute :id, Types::Integer
      end
    end
  end
end
