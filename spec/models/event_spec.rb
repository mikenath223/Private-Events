# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should have_db_column(:date) }
  it { should have_db_column(:location) }
  it { should have_db_column(:description) }
  it { should have_db_column(:creator_id) }
  it { should have_db_index(:creator_id) }
  it { should have_many(:attendees) }
end
