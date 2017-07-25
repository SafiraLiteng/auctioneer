class ItemSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :author_full_name

  has_many :biddrs

  class BiddrSerializer < ActiveModel::Serializer
    attributes :id, :body
  end

  def author_full_name
    object.user&.full_name
  end
end
