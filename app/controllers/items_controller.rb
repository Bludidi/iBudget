class ItemsController < ApplicationController
  before_action :set_user

  # GET /items or /items.json
  def index
    @categories = Category.find_by(id: params[:category_id])
    # @category = @categories.find(params[:category_id])
    @items = ItemCategory.includes(:item).where(category: @categories).order(created_at: :desc)
    @total = @items.map{ |paid| paid.item.amount }.sum  
  end

  # GET /items/new
  def new
    @categories = @user.categories
    @category = @categories.find(params[:category_id])
    @item = Item.new
  end

  # POST /items or /items.json
  def create
    @category = Category.find(params[:category_id])
    @item = @user.items.new(item_params)

    return unless @item.save

    @item_categories = ItemCategory.new(category_id: @category.id, item_id: @item.id)
    return unless @item_categories.save

    redirect_to categories_path
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = current_user
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:name, :amount)
  end
end
