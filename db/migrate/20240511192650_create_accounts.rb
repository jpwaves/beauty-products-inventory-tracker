class CreateAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.string :email, null: false
      t.string :encrypted_password, null: false

      t.timestamps
    end
  end
end
