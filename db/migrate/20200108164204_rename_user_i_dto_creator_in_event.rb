# frozen_string_literal: true

class RenameUserIDtoCreatorInEvent < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :user_id, :creator_id
  end
end
