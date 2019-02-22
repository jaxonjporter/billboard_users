class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.belongs_to :artist, index: true
      t.belongs_to :list, index: true
      t.string :name

      t.timestamps
    end
  end
end
