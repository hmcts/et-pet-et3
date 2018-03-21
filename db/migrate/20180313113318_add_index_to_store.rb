class AddIndexToStore < ActiveRecord::Migration[5.1]
  def change
    add_index :stores, :uuid, unique: true
  end
end
