# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserEvent, type: :model do
  it { should belong_to(:event) }
  it { should belong_to(:user) }
end
