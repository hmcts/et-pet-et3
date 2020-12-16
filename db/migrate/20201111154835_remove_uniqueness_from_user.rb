class RemoveUniquenessFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_index :users, column: :email, unique: true
  end
end
