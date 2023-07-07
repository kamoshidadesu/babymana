class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @name = current_user.name
    @gender = current_user.gender.name
  end

  def edit
  end
end
