class Track < ActiveRecord::Base
  belongs_to :album

  validates :title, :presence => true
  validates :duration, :presence => true
end
