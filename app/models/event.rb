class Event < ApplicationRecord
  has_many :user_events
  has_many :attendees, -> { distinct }, through: :user_events, source: 'user'

  belongs_to :creator, class_name: :User, foreign_key: :creator_id
  
  validates :date, :location, :description, presence: true

  scope :upcoming_events, -> { where('date > ?', Date.today) }
  scope :prev_events, -> { where('date < ?', Date.today) }
end
