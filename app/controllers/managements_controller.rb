class ManagementsController < ApplicationController
  before_action :set_management, only: [:show, :edit, :update, :destroy]

  def new
    @managements = Management.all
    @management = Management.new
  end

  def create
    @management = Management.new(management_params)
    if @management.save
      @managements = Management.all
      redirect_to new_management_path
    else
      @managements = Management.all
      render :new
    end
  end

  def show
    @managements = Management.where(start_time: @management.start_time.to_date.beginning_of_day..@management.start_time.to_date.end_of_day)
    if @management.user_id == current_user.id
    else
      redirect_to root_path
    end
  end

  def edit
    if @management.user_id == current_user.id
    else
      redirect_to root_path
    end
  end

  def update
    if @management.update(management_params)
      redirect_to management_path(@management.id), method: :get
    else
      render :edit
    end
  end

  def destroy
    if @management.user_id == current_user.id
      @management.destroy
      redirect_to root_path
    else
      render 'show', id: @management.id
    end
  end

  private

  def management_params
    params.require(:management).permit(:start_time, :record_id, :note).merge(user_id: current_user.id)
  end

  def set_management
    @management = Management.find(params[:id])
  end
end
