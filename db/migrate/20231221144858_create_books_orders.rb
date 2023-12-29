class CreateBooksOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :books_orders do |t|
      t.references :book, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
