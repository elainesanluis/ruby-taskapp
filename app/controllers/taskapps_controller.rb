# app/controllers/taskapps_controller.rb
class TaskappsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category
  before_action :set_taskapp, only: [:show, :edit, :update, :destroy]

  def index
    @taskapps = @category.taskapps.all
    redirect_to category_path(@category)
  end

  def show 
      @taskapp = @category.taskapps.find(params[:id])
  end
  
  def new
    @taskapp = @category.taskapps.build
  end

  def create
    @category = current_user.categories.find(params[:category_id])
    @taskapp = @category.taskapps.build(taskapp_params)
    if @taskapp.save
      redirect_to category_taskapps_path(@category), notice: 'Task created!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @taskapp.update(taskapp_params)
      redirect_to category_taskapp_path(@category, @taskapp), notice: 'Taskapp was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @taskapp = Taskapp.find(params[:id])
    @taskapp.destroy
    redirect_to category_taskapps_path(@category), notice: 'Taskapp was successfully destroyed.'
  end

  private

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end

  def set_taskapp
    @taskapp = @category.taskapps.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to category_taskapps_path(@category), alert: 'Taskapp not found'
  end

  def taskapp_params
    params.require(:taskapp).permit(:title, :description, :category_id, :status, :due_date, :action)
  end

  
end
