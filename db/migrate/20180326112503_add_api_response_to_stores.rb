class AddApiResponseToStores < ActiveRecord::Migration[5.1]
  def change
    add_column :stores, :api_response, :string, default: nil
  end
end
