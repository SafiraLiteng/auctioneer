class BiddrsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_biddr, only: [:destroy]

  def create
    puts "--------------------->"
    @item = Item.find params[:item_id]
    @biddr = Biddr.new biddr_params    
    @biddr.item = @item
    @biddr.user = current_user
    respond_to do |format|
      if @biddr.save
        
        @item.current_price = @biddr.bid
        @item.save

        BiddrsMailer.notify_items_owner(@biddr).deliver_later
        format.html { redirect_to item_path(@item), notice: 'Biddr Created!' }
        format.js { render :create_success }
      else
        format.html { render 'items/show' }
        format.js { render :create_failure }
      end
    end
  end

  def destroy
    @item = @biddr.item
    # @question = Question.find param[:question_id]
    @biddr.destroy

    respond_to do |format|
      format.html { redirect_to item_path(@item), notice: 'Biddr Deleted!' }
      format.js { render }
    end
  end

  private

  def find_biddr
    @biddr = Biddr.find(params[:id])
  end

  def biddr_params
    params.require(:biddr).permit(:bid)
  end
end
