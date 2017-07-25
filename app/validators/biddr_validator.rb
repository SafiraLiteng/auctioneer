class BiddrValidator < ActiveModel::Validator
  def validate(record)

    @item = Item.find(record.item_id)
    @isBidValid = @item.biddrs.where('bid >= ?', record.bid).empty?
      
    if !@isBidValid
      record.errors[:name] << 'Bid need to be bigger than previous!'
    end
  end
end
 