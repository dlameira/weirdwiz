class PostPolicy < ApplicationPolicy
  class Scope < Scope

  end

  def show?
    true
  end

  def update?
    current_user.admin?
  end

  def destroy?
    current_user.admin?
  end

  def create?
    current_user.admin?
  end

end
