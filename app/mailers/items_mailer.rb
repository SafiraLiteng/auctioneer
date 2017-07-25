class ItemsMailer < ApplicationMailer

  def send_reminder(item)
    @item = item
    @item = item.user
    if @item
      mail(to: @item.email, subject: 'Item Reminder')
    end
  end

end
