class AddUsernameToTable < ActiveRecord::Migration[7.0]
  def change
    # add_column :table_name, :column_name, :type, default/options
    add_column :users, :username, :string 
  end
end
