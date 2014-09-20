class CreateThegrafts < ActiveRecord::Migration
  def change
    create_table :thegrafts do |t|
      t.string :email
      t.string :first_name
      t.string :zip_code
      t.string :password_digest
      t.string :cid
      t.string :notes
      t.string :aux_1
      t.string :aux_2

      t.timestamps
    end
  end
end
