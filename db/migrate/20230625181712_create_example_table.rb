# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :example do
      primary_key :id

      column :example, String, null: false

      DateTime :created_at, null: false, default: Sequel::CURRENT_TIMESTAMP
      DateTime :updated_at, null: false, default: Sequel::CURRENT_TIMESTAMP
    end
  end
end
