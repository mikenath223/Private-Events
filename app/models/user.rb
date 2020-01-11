class User < ApplicationRecord
  has_secure_password

  has_many :user_events

  has_many :events, class_name: :Event, foreign_key: :creator_id
  has_many :attended_events, -> { distinct }, through: :user_events, source: 'event'
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
  validates :password, presence: true, length: { minimum: 6 }

end
