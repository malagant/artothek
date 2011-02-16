class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.string :title
      t.string :subtitle
      t.text :description
      t.date :issue_date
      t.references :user
      t.references :artist

      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end
