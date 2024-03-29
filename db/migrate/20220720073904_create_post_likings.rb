# frozen_string_literal: true

class CreatePostLikings < ActiveRecord::Migration[7.0]
  def change
    create_table :post_likings do |t|
      t.integer :post_id
      t.integer :user_id

      t.timestamps
    end
  end
end
