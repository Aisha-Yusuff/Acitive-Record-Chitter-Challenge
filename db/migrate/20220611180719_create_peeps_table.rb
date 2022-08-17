class CreatePeepsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :peeps do |t|
      t.string :contents
      t.timestamps 
    end
  end
end
