# frozen_string_literal: true

# auto_register: false

module Persistence
  module Concerns
    module Filtering
      def with_filter(filters)
        where(filters)
      end
    end
  end
end
