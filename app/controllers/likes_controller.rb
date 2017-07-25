class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item

  def create
    @like = Like.new(item: @item, user: current_user)

    if cannot? :like, @item
      like_flash :alert, "Cannot like your own item, dummy!"
    elsif @like.save
      like_flash :notice, "Thanks for liking!"
    else
      like_flash :alert, @like.pretty_errors
    end

    respond_to do |format|
      format.html { redirect_to item_path(item) }
      format.js { render }
    end
  end

  def destroy
    like = Like.find(params[:id])

    if like.destroy
      like_flash :notice, "😕"
    else
      like_flash :alert, like.pretty_errors
    end
    respond_to do |format|
      format.html { redirect_to item_path(like.item) }
      format.js { render }
    end
  end

  private
  def find_item
    @item = Item.find(params[:item_id])
  end

  def like_flash(type, message)
    # like_flash(:alert, "Failed to save")
    if request.format.js?
      flash.now[type] = message
    else
      flash[type] = message
    end
  end
end
