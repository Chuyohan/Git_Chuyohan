class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :manager
      t.string :category

      t.timestamps null: false
    end
  end
end
