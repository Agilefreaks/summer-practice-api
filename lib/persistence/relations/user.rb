# frozen_string_literal: true

require 'persistence/relation'
# require_relative '../concerns/filtering'

module Persistence
  module Relations
    class User < Persistence::Relation
      schema(:users, infer: true)
    end
  end
end
