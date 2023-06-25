# frozen_string_literal: true

require 'persistence/relation'
require_relative '../concerns/filtering'

module Persistence
  module Relations
    class Users < Persistence::Relation
      include Concerns::Filtering

      schema(:users, infer: true)
    end
  end
end
