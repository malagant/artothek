class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :nickname, :first_name, :last_name


  has_many :artists
  has_many :albums

  def full_name
    "#{first_name} #{last_name}"
  end

  def nickname
    attributes[:nickname] ? attributes[:nickname] : self.email
  end
end
