class User < ApplicationRecord
  before_save { self.email = email.downcase }

  has_many :events, class_name: :Event, foreign_key: :creator_id

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
end
