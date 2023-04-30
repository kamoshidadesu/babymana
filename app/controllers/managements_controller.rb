class ManagementsController < ApplicationController
  

  def new
    @managements = Management.all
    @management = Management.new
  end
  

  def create
    @management = Management.new(management_params)
    if @management.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def management_params
  params.require(:management).permit(:start_time, :record_id, :note).merge(user_id: current_user.id)
  end


end
