# frozen_string_literal: true

ROM::SQL.migration do
  change do
    alter_table :users do
      add_column :avatar_url, String, null: false, default: ''
    end
  end
end
