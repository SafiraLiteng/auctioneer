class BiddrsMailer < ApplicationMailer

  def notify_items_owner(biddr)

    @biddr   = biddr
    @item = biddr.question
    @user     = @item.user

    if @user
      mail(to: @user.email, subject: 'You got an biddr to your question')
    end
  end

end
