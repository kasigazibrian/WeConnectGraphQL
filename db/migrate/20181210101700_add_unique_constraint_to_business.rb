class AddUniqueConstraintToBusiness < ActiveRecord::Migration[5.2]
  def change
    add_index :businesses, %w[contact_number name email], unique: true
  end
end
