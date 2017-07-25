class Api::V1::ItemsController < Api::ApplicationController
  before_action :authenticate_user!
  before_action :find_item, only: [:show]
  def show
    # Test if we're getting the current_user by rendering it
    # render json: current_user
    render json: @item
  end

  def index
    @items = Item.all
    # by default, rails will to look for an instance variable named
    # after controller and it will render (in this case as json)
    # render json: @items

    # when using jBuilder, make sure that you do not
    # render with `render json: ...` otherwise rails will serialize
    # the model itself into json instead of using your jbuilder view
    render
  end

  def create
    item = Item.new(item_params)

    if item.save
      render json: { id: item.id }
    else
      render json: { errors: item.errors.full_messages }
    end
  end

  private
  def item_params
    params.require(:item).permit(:title, :body)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
