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

  def edit
    @diary = Diary.find(params[:id])
      if current_user.id == @diary.user_id 
      else
      redirect_to root_path
    end
  end

  def update
    @diary = Diary.find(params[:id])
    if @diary.update(diary_params)
      redirect_to diary_path(@diary.id), method: :get
    else
      render :edit
    end
  end


  private

  def diary_params
    params.require(:diary).permit(:image, :happy, :diary, :start_time).merge(user_id: current_user.id)
  end


end


