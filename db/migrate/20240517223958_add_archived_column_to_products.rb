class AddArchivedColumnToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :archived, :boolean, default: false, null: false
  end
end
