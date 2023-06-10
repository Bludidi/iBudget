class CategoriesController < ApplicationController
  before_action :set_user

  # GET /categories or /categories.json
  def index
    @categories = @user.categories
    @item_categories = ItemCategory.all
    @items = @user.items
    update_total_amount
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

   # DELETE /category/1 or /category/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    update_total_amount

    respond_to do |format|
      format.html { redirect_to category_path, notice: 'Category was successfully destroyed!' }
      format.json { head :no_content }
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

  # def delete_item_amount
  #   @items = @user.items
  #   @total = @items.map { |item| item.amount }.sum
  #   if 

  # end

  def update_total_amount
    @items = @user.items
    @total = @items.map { |item| item.amount }.sum
  end
end
