# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.text :body
      t.integer :user_id
      t.boolean :seen

      t.timestamps
    end
  end
end
