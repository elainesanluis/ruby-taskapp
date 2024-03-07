class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = current_user.categories
    @taskapps = Taskapp.joins(:category).where(categories: { user_id: current_user.id })
  end

  def show_joined_table
    @categories_and_taskapps = Taskapp.includes(:category).where(categories: { user_id: current_user.id })
  end

  def alltasks
    @categories_and_taskapps = current_user.categories.includes(:taskapps)
    render 'view-all'
  end

  def show
    if defined?(@show_joined_table_view) && @show_joined_table_view
      render 'view-all'
    elsif defined?(@category)
      @taskapps = @category.taskapps
    else
      flash[:alert] = "Invalid request"
      redirect_to categories_path
    end
  end

  def new
    @category = current_user.categories.build
    @category.taskapps.build
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      flash[:notice] = "Category and tasks created successfully!"
      redirect_to categories_path
    else
      flash[:alert] = "Error creating category and tasks"
      render :new
    end
  end

  def edit
    @category = current_user.categories.find(params[:id])
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "Category and tasks updated successfully!"
      redirect_to categories_path
    else
      flash[:alert] = "Error updating category and tasks"
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:notice] = "Category and tasks deleted successfully!"
    redirect_to categories_path
  end

  private

  def set_category
    if params[:id] == 'show_joined_table'
      @show_joined_table_view = true
    else
      @category = current_user.categories.find(params[:id])
    end
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
