class Artist < ActiveRecord::Base
  belongs_to :user
  has_many :albums

  validates :name, :presence => true, :uniqueness => true
end
