# frozen_string_literal: true

class CreateFriendships < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t|
      t.integer :user_id
      t.integer :friend_id
      t.boolean :status

      t.timestamps
    end
  end
end
