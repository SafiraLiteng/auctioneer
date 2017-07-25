class ItemReminderJob < ApplicationJob
  queue_as :default

  def perform(item_id)
    item = Item.find item_id
    if item.biddrs.count == 0
      ItemsMailer.send_reminder(item).deliver_now
    end
  end
end
