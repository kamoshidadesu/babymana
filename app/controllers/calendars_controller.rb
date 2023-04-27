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
    if @calendar.user_id == current_user.id
      else
        redirect_to root_path
      end
  end
  
  def edit
    @calendar = Calendar.find(params[:id])
    if @calendar.user_id == current_user.id
    else
      redirect_to root_path
    end
  end

  def update
    @calendar = Calendar.find(params[:id])
    if @calendar.update(calendar_params)
      redirect_to calendar_path(@calendar.id), method: :get
    else
      render :edit
    end
  end

  def destroy
    @calendar = Calendar.find(params[:id])
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

end
