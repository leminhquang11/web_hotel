# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Service

    if user.present?
        can :show, User, id: user.id
        if user.has_role? :admin
            can :access, :rails_admin
            can :read, :dashboard
            can :manage, [User, Provider, Category]
            can :read, [ServiceBooking]
        end

    end

  end
end
