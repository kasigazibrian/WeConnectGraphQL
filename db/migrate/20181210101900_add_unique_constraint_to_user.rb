class AddUniqueConstraintToUser < ActiveRecord::Migration[5.2]
  def change
    add_index :users, %w[username email], unique: true
  end
end
