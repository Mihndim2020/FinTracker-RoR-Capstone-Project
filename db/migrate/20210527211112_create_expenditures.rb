class CreateExpenditures < ActiveRecord::Migration[6.1]
  def change
    create_table :expenditures do |t|
      t.string :name
      t.integer :amount

      t.timestamps
    end
  end
end
