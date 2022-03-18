class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= AdminUser.new

    if admin.user
      can :manage, :all
    end
  end
end