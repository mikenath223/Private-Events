# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :remember_token

  has_secure_password

  has_many :user_events

  has_many :events, class_name: :Event, foreign_key: :creator_id
  has_many :attended_events, -> { distinct }, through: :user_events, source: 'event'

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/, 
  uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  # Returns the hash digest of the given string.
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?

    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user
  def forget
    update_attribute(:remember_digest, nil)
  end
end
