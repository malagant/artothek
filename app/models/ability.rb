class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.id # valid user
      can :manage, [Artist, Album], :user_id => user.id
      can :manage, Track
      can :read, [Album, Track, Artist, User]
    else # guest user
      can :read, [Album, Track, Artist, User]
    end
  end
end
