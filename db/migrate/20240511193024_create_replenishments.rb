class CreateReplenishments < ActiveRecord::Migration[7.1]
  def change
    create_table :replenishments do |t|
      t.references :account, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.date :fulfilled_at

      t.timestamps
    end
  end
end
