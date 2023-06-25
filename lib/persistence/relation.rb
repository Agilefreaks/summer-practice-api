# frozen_string_literal: true

require 'rom/relation'
require_relative 'commands'

module Persistence
  class Relation < ROM::Relation[:sql]
    include Persistence::Commands
  end
end
