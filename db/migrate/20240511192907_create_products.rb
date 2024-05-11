class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :quantity, null: false
      t.string :purchase_link
      t.string :purchase_link_website_name
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
