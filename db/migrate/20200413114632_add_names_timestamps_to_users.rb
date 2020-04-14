class AddNamesTimestampsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    remove_column :users, :name, :string
    add_timestamps(:users)
  end
end
