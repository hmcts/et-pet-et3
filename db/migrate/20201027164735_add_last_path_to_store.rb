class AddLastPathToStore < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :last_path, :string , null: false , default: "/respond/respondents_details"
  end
end
