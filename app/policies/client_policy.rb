class ClientPolicy < ApplicationPolicy
  def update?
    can_moderate?(user, record)
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
end