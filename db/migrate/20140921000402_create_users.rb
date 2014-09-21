class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :zipcode
      t.string :password_digest
      t.string :cids
      t.string :notes
      t.string :code
      t.string :aux_1
      t.string :aux_2

      t.timestamps
    end
  end
end
