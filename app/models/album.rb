class Album < ActiveRecord::Base
  belongs_to :artist
  belongs_to :user
  has_many :tracks, :dependent => :destroy

  has_attached_file :cover, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  acts_as_commentable

  validates :title, :presence => true

  define_index do
    indexes title, :sortable => true
    indexes tracks(:title), :as => :tracks, :sortable => true
    indexes artist.artist_name, :as => :artist_name, :sortable => true
    indexes artist.first_name, :as => :first_name, :sortable => true
    indexes artist.last_name, :as => :last_name, :sortable => true
    indexes artist.twitter, :as => :twitter, :sortable => true

    has artist_id, created_at, updated_at
  end
end
