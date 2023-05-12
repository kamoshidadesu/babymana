class DiariesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_diary, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @diaries = Diary.all
    @diary = Diary.new
  end
  
  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      redirect_to new_diary_path
    else
      render :new
    end
  end

  def show
    if @diary.user_id == current_user.id 
    else
      redirect_to root_path
    end
  end

  def edit
    if @diary.user_id == current_user.id 
      else
      redirect_to root_path
    end
  end

  def update
    if @diary.update(diary_params)
      redirect_to diary_path(@diary.id), method: :get
    else
      render :edit
    end
  end

  def destroy
    if @diary.user_id == current_user.id 
      @diary.destroy
      redirect_to new_diary_path
    else
      render item_path(@diary.id), method: :get
  end
end

  private

  def diary_params
    params.require(:diary).permit(:image, :happy, :diary, :start_time).merge(user_id: current_user.id)
  end

  def set_diary
    @diary = Diary.find(params[:id])
  end

end


