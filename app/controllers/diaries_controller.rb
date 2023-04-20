class DiariesController < ApplicationController
  def index
    @diaries = Diary.all
  end

  def new
    @diaries = Diary.new
  end
  
  def create
    if
    Diary.create(diary_params)
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def diary_params
    params.require(:diary).permit(:image, :happy, :diary, :posted_date).merge(user_id: current_user.id)
  end


end


