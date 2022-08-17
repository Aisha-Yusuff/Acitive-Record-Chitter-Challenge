class CreateFirstTable < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t| # t = type
      t.string :name # create column called name with a string type
      # t.timestamps # Add two colums to table - created_at and updated_at to track changes to data 
    end 
  end
end
