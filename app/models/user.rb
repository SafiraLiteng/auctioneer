class User < ApplicationRecord

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: VALID_EMAIL_REGEX

  before_create :generate_api_key
  before_validation :downcase_email

  has_many :items, dependent: :nullify

  has_many :likes, dependent: :destroy
  has_many :liked_items, through: :likes, source: :item

  has_many :votes, dependent: :destroy
  has_many :voted_items, through: :votes, source: :item
  has_many :biddrs, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def generate_api_key

    loop do

      self.api_key = SecureRandom.hex(32)
			
      break unless User.exists?(api_key: api_key)
    end
  end

  def downcase_email
    self.email&.downcase!
  end
end
