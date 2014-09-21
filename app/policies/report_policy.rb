class ReportPolicy < ApplicationPolicy
  def update?
    can_moderate?(user, record)
  end

  def edit?
    update?
  end
end