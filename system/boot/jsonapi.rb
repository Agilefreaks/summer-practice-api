# frozen_string_literal: true

Api::Container.boot :jsonapi, namespace: true do
  init do
    require 'fast_jsonapi'
  end
end
