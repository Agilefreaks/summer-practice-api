# frozen_string_literal: true

require 'persistence/relation'
# require_relative '../concerns/filtering'

module Persistence
  module Relations
    class Example < Persistence::Relation
      schema(:example, infer: true)
    end
  end
end
