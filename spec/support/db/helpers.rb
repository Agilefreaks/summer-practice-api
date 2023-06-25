# frozen_string_literal: true

module Test
  module Database
    module Helpers
      module_function

      def rom
        Api::Container['persistence.rom']
      end

      def db
        Api::Container['persistence.db']
      end
    end
  end
end
