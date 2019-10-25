class Ability
  include CanCan::Ability

  def initialize(user)

    user = user || User.new
    if user.role.present? && user.role.eql?('admin')
      can :manage, :all
    end
  end
end
