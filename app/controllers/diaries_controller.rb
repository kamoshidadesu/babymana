class DiariesController < ApplicationController

  def new
    @diaries = Diary.all
    @diary = Diary.new
  end
  
  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @diary = Diary.find(params[:id])
  end


  private

  def diary_params
    params.require(:diary).permit(:image, :happy, :diary, :start_time).merge(user_id: current_user.id)
  end


end


