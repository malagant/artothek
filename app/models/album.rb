class Album < ActiveRecord::Base
  belongs_to :artist
  belongs_to :user
  has_many :tracks

  has_attached_file :cover, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
