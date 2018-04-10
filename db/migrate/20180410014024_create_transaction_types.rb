class CreateTransactionTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :transaction_types do |t|
      t.string :name

      t.timestamps
    end
    add_reference :expenses, :transaction_type, foreign_key: true
  end
end
