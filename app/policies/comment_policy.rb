class CommentPolicy < ApplicationPolicy

  def edit?
    @model.try(:author) == @current_user
  end

  def update?
    @model.try(:author) == @current_user
  end

  def destroy?
    @model.try(:author) == @current_user
  end

end
