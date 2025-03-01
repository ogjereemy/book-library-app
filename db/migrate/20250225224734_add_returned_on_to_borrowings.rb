class AddReturnedOnToBorrowings < ActiveRecord::Migration[8.0]
  def change
    add_column :borrowings, :returned_on, :date
  end
end
