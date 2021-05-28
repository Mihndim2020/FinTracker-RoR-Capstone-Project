class AddUserRefToExpenditures < ActiveRecord::Migration[6.1]
  def change
    add_reference :expenditures, :author, null: false, foreign_key: {to_table: :users}, default: 1
    add_reference :expenditures, :group, foreign_key: { to_table: :groups }, default: :nil
  end
end
