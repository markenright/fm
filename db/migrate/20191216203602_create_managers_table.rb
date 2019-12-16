class CreateManagersTable < ActiveRecord::Migration
  def change
      create_table :managers do |t|
         t.string :name
         t.integer :age
      end
  end
end
