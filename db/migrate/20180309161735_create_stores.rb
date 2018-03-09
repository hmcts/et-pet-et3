class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :uuid
      t.text :hash_store

      t.timestamps
    end
  end
end
