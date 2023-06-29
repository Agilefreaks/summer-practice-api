# frozen_string_literal: true

ROM::SQL.migration do
  change do
    create_table :users do
      primary_key :id

      column :first_name, String, null: false
      column :last_name, String, null: false
      column :email, String, null: false
      column :avatar_url, String, null: false
      column :age, Integer, null: false
      
      DateTime :created_at, null: false, default: Sequel::CURRENT_TIMESTAMP
      DateTime :updated_at, null: false, default: Sequel::CURRENT_TIMESTAMP
    end
  end
end
