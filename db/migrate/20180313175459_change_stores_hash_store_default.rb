class ChangeStoresHashStoreDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default :stores, :hash_store, {}.to_yaml
  end
end
