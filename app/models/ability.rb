class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Expense, public: true

    return unless user.present?

    can :manage, Expense, author_id: user.id
    can :manage, Group, author_id: user.id
  end
end
