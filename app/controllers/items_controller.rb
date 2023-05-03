class ItemsController < ApplicationController
  before_action :set_user

  # GET /items or /items.json
  def index
    @categories = Category.find_by(id: params[:category_id])
    # @category = @categories.find(params[:category_id])
    @items = ItemCategory.includes(:item).where(category: @categories).order(created_at: :desc)
  end

  # GET /items/new
  def new
    @categories = @user.categories
    @category = @categories.find(params[:category_id])
    @item = Item.new
  end

  # GET /items/1/edit
  def edit; end

  # POST /items or /items.json
  def create
    @category = Category.find(params[:category_id])
    @item = @user.items.new(item_params)

    return unless @item.save

    @item_categories = ItemCategory.new(category_id: @category.id, item_id: @item.id)
    return unless @item_categories.save

    redirect_to item_categories_path(@category)
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to item_url(@item), notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
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
