# frozen_string_literal: true

# auto_register: false

require 'dry/view'

module Api
  class View < Dry::View
    config.paths = [File.join(__dir__, 'views/templates')]
  end
end
