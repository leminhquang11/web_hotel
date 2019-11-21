# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Hotel

    if user.present?
      can :show, User, id: user.id

      if user.has_role? :moderator
        can [:new, :create, :admin_index], Hotel
        can [:admin_show, :edit, :update, :destroy], Hotel,
          id: Hotel.with_role(:moderator, user).pluck(:id)
        can :manage, :all if user.has_role? :admin
      end
    end
  end
end
# class Ability include CanCan::Ability def initialize(user)
#  can :dashboard, :all 
#  can :access, :rails_admin 
#  can :read, :dashboard 
#  # to allow access, you have to put this. 
#   end 
# end