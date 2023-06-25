# frozen_string_literal: true

Api::Container.boot :environment do
  init do
    register(:environment) do
      Module.new do
        module_function

        %i[test? development? staging? production?].each do |method|
          define_method(method) { ENV['RACK_ENV'] == method[0...-1] }
        end
      end
    end
  end
end
