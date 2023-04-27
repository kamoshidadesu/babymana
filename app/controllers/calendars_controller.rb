class CalendarsController < ApplicationController
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
    @calendar = Calendar.find(params[:id])
    @calendars = Calendar.all.group_by { |calendar| calendar.start_time.to_date }
  end
  
  def edit
  end

  private

  def calendar_params
    params.require(:calendar).permit(:start_time, :end_time, :schedule, :content).merge(user_id: current_user.id)
  end

end
