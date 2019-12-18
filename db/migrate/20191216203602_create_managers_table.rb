class CreateManagersTable < ActiveRecord::Migration
  def change
      create_table :managers do |t|
          t.string :name
          t.integer :age
          t.integer :team_id
      end
  end
end
