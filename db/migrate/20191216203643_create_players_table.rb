class CreatePlayersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
         t.string :name
         t.string :uniform_number
         t.integer :team_id
         
    end
  end
end
