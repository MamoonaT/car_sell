# frozen_string_literal: true

class AdPolicy < ApplicationPolicy
  class Scope < AdPolicy
    attr_reader :user, :scope

    def pundit_user
      current_users
    end

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      @scope.where(ad_id: @user.ad_id)
    end
  end

  def update?
    user.present?
  end

  def edit?
    user.present?
  end

  def destroy?
    user.present?
  end
end
