class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @name = current_user.name
    @gender = current_user.gender.name
    @calendars = current_user.calendars
    @diaries = current_user.diaries
  end

  def edit
  end

end
