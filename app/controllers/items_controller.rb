class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    # binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find_by(id: params[:id])
  end

  # def edit
  # end

  # def destroy
  # end

  private

  def item_params
    params.require(:item).permit(:image, :item_name,:item_describe,:item_price, :category_id, :situation_id, :prefecture_id, :delivary_id, :day_id).merge(user_id: current_user.id)
  end

  
end
