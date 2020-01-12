# frozen_string_literal: true

class UserEvent < ApplicationRecord
  belongs_to :user
  belongs_to :event
end
