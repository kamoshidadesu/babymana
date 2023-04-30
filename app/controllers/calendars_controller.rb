class CalendarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_calendar, only: [:show, :edit, :update, :destroy]

  
  def index
    @calendars = Calendar.all 
  end

  def new
    @calendar = Calendar.new
  end

  def create
    @calendar = Calendar.new(calendar_params)
    if @calendar.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @calendars = Calendar.all.group_by { |calendar| calendar.start_time.to_date }
    if @calendar.user_id == current_user.id
      else
        redirect_to root_path
      end
  end
  
  def edit
    if @calendar.user_id == current_user.id
    else
      redirect_to root_path
    end
  end

  def update
    if @calendar.update(calendar_params)
      redirect_to calendar_path(@calendar.id), method: :get
    else
      render :edit
    end
  end

  def destroy
    if @calendar.user_id == current_user.id
      @calendar.destroy
      redirect_to root_path
    else
      render calendar_path(@calendar.id), method: :get
  end
end


  private

  def calendar_params
    params.require(:calendar).permit(:start_time, :end_time, :schedule, :content).merge(user_id: current_user.id)
  end

  def set_calendar
    @calendar = current_user.management.calendars.find(params[:id])
  end

end
