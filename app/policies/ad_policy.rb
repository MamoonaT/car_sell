# frozen_string_literal: true

class AdPolicy < ApplicationPolicy
  alias ad record

  def index?
    user.id == ad.user_id
  end

  def create
    user.id == ad.user_id
  end

  def update?
    user.id == ad.user_id
  end

  def edit?
    user.id == ad.user_id
  end

  def destroy?
    user.id == ad.user_id
  end
end
