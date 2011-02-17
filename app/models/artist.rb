class Artist < ActiveRecord::Base
  belongs_to :user
  has_many :albums, :dependent => :destroy

  validates :artist_name, :presence => true, :uniqueness => true
end
