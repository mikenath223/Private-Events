# frozen_string_literal: true

module EventsHelper
  def show_creator(event)
    User.find(event.creator_id).name
  end

  def check_owner(event)
    link_to 'Edit event', edit_event_path(event)  if event.creator_id == current_user.id
  end
end
