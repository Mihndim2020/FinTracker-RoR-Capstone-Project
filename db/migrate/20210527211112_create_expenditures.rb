class CreateExpenditures < ActiveRecord::Migration[6.1]
  def change
    create_table :expenditures do |t|
      t.string :name
      t.integer :author_id
      t.integer :group_id
      t.integer :amount

      t.timestamps
    end
  end
end
