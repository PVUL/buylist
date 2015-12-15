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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(item_params)
      flash[:notice] = 'Successfully Updated'
      redirect_to items_path
    else
      flash[:notice] = @item.errrors.full_messages.join('. ')
      render :edit
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    Item.find(params[:id]).destroy
    flash[:notice] = 'Successfully Deleted'
    redirect_to items_path
  end

  private

  def item_params
    params.required(:item).permit(:name, :price)
  end
end
