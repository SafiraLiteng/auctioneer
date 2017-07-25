class Item < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category, optional: true
  has_many :biddrs , dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user

  has_many :votes, dependent: :destroy
  has_many :voters, through: :votes, source: :user

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  validates(:title, { presence: { message: 'must be provided' },
                      uniqueness: true })
  validates(:body, { length: { minimum: 5, maximum: 1000 }})
  validates :view_count, numericality: { greater_than_or_equal_to: 0 }

  after_initialize :set_defaults
  before_validation :titleize_title

  mount_uploader :image, ImageUploader

  # scope :recent, lambda {|number| order(created_at: :desc).limit(number) }
  def self.recent(number)
    order(created_at: :desc).limit(number)
  end

  def cap_title
    title.upcase
  end

  def vote_total
    votes.up.count - votes.down.count
  end

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders, :history]

  private

  def set_defaults
    self.view_count ||= 0
  end

  def titleize_title
    self.title = title.titleize if title.present?
  end

end
