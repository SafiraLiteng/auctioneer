class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  before_action :find_item, only: [:show, :edit, :update, :destroy]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new item_params
    @item.user = current_user
    if @item.save
      ItemReminderJob.set(wait: 5.days).perform_later(@item.id)

      flash[:notice] = 'Item created'
      redirect_to item_path(@item)
    else

      flash.now[:alert] = 'Please fix errors below'

      render :new
    end
  end

  def show
    @like = @item.likes.find_by(user: current_user)
    @biddr = Biddr.new
    @biddrs = @item.biddrs.order(created_at: :desc)
  end

  def index
    if params.has_key? :user_id
      @user = User.find(params[:user_id])
      @items = @user.liked_items.order(created_at: :desc)
    else
      @items = Item.recent(30)
    end

    respond_to do |format|

      format.html { render }

      format.json { render json: @items }
      format.xml { render xml: @items }
    end
  end

  def edit

    head :unauthorized unless can? :edit, @item
  end

  def update
    if !(can? :update, @item)
      head :unauthorized

	elsif @item.update(item_params.merge({ slug: nil }))

      redirect_to item_path(@item), notice: 'Item updated'
    else
      render :edit
    end
  end

  def destroy
    if can? :destroy, @item
      @item.destroy
      redirect_to items_path, notice: 'Item deleted'
    else
      head :unauthorized
    end
  end

  private

  def item_params
    params.require(:item).permit([:title,
                                      :body,
                                      :category_id,
                                      :image,
                                      { tag_ids: [] }])
  end

  def find_item
    @item = Item.find params[:id]
  end

end
