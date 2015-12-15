class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:notice] = 'Successfully Added'
      redirect_to items_path
    else
      flash[:notice] = @item.errrors.full_messages.join('. ')
      render items_path
    end
  end

  private

  def item_params
    params.required(:item).permit(:name, :price)
  end
end
