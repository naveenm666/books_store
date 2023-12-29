class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.integer :visits
      t.integer :ordercount

      t.timestamps
    end
  end
end
