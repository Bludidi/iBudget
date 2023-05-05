class CategoriesController < ApplicationController
  before_action :set_user

  # GET /categories or /categories.json
  def index
    @categories = @user.categories
    @item_categories = ItemCategory.all
    #@category = Category.find(params[:id])
    #@icon_path = @category.icon.url
  end

  # GET /categories/1 or /categories/1.json
  def show
    @category = Category.find(params[:id])
    @items = []
    @category.item_categories.order(:id).each do |item_category|
      @items << item_category.item_categories
    end
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)
    @category.user = @user
    if @category.save
      redirect_to categories_path
    else
      render :new
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = current_user
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
