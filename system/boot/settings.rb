# frozen_string_literal: true

Api::Container.boot :settings, from: :system do
  before(:init) { require 'types' }

  settings do
    key :database_url, Types::Strict::String.constrained(filled: true)
    key :host_url, Types::Strict::String.constrained(filled: true)
  end
end
