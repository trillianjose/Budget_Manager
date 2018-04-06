class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.float :amount, null: false
      t.string :concept, null: false
      t.datetime :date, null:false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
