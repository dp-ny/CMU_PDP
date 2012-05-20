class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities

    user ||= User.new

    semester = Semester.current_semester
    year = Time.now.year
    semester_name = "#{semester} #{year}"

    event_admin = [UserPosition.find_current('secretary'), UserPosition.find_current('president'), UserPosition.find_current('vice president'), UserPosition.find_current('webmaster') ]
    treasury_admin = [UserPosition.find_current('treasurer'), UserPosition.find_current('president'), UserPosition.find_current('vice president'), UserPosition.find_current('webmaster') ]
    website_admin = [UserPosition.find_current('president'), UserPosition.find_current('vice president'), UserPosition.find_current('webmaster')]

    if website_admin.include?(user) || user.role == 'admin'
      can :manage, :all
    elsif event_admin.include?(user)
      can :create, Event
      can :update, Event
      can :read, :all
    elsif treasury_admin.include?(user)
      can :create, Transaction
      can :update, Transaction
      can :destroy, Transaction
      can :read, :all
    elsif user.role == 'user'
      can :update, User do |u|
        u.id == user.id
      end
      can :read, :all
    elsif
      can :read, :all
    end

  end
end
