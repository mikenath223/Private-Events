module EventsHelper

  def show_creator(event)
    User.find(event.creator_id).name
  end
end
