class CreateTeamsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.integer :user_id
      t.string :name
      t.string :country
      
      t.timestamps
    end
  end
end
