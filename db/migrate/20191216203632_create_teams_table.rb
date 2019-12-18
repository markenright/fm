class CreateTeamsTable < ActiveRecord::Migration
  def change
    create_table :teams do |t|
          t.string :name
          t.string :country
          t.integer :player_id
    end
  end
end
