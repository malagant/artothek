class Artist < ActiveRecord::Base
  belongs_to :user
  has_many :albums, :dependent => :destroy

  validates :artist_name, :presence => true, :uniqueness => true

  def real_name
    "#{first_name} #{last_name}"
  end
end
