class Ability
    include CanCan::Ability
  
    def initialize(user)
      # Define abilities for the passed in user here. For example:
  
      user ||= User.new # guest user (not logged in)
    #   binding.pry;
      
        # if user.admin_users?
        if true
            can :manage, :all
            # can :access, :rails_admin       # only allow admin users to access Rails Admin
            can :manage, :dashboard         # allow access to dashboard
        end
    end
end