class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :name
      t.string :category
      t.string :picture
      t.text :intro
      t.string :location
      t.string :personnel
      t.text :history
      t.string :phone

      t.timestamps null: false
    end
  end
end
