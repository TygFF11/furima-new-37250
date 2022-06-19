class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :only_user, only: [:edit]

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

  def edit
    @item = Item.find_by(id: params[:id])
  end

  def update
    @item = Item.find_by(id: params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  # def destroy
  # end

  private

  def item_params
    params.require(:item).permit(:image, :item_name,:item_describe,:item_price, :category_id, :situation_id, :prefecture_id, :delivary_id, :day_id).merge(user_id: current_user.id)
  end

  def only_user
    @item = Item.find_by(id: params[:id])
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end
  
end
