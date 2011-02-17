class CreateArtists < ActiveRecord::Migration
  def self.up
    create_table :artists do |t|
      t.string :artist_name, :first_name, :last_name, :email, :homepage, :twitter

      t.timestamps
    end
  end

  def self.down
    drop_table :artists
  end
end
