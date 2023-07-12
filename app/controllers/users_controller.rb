class UsersController < ApplicationController
  def new

  end
  
  def show
    @nickname = current_user.nickname
    @name = current_user.name
    @gender = current_user.gender.name
    @calendars = current_user.calendars
    @diaries = current_user.diaries
  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit(:image).merge(user_id: current_user.id)
  end
end
