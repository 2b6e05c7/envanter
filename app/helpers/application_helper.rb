module ApplicationHelper
  def public_activity_view_for_key(key)
    "activity.#{key.split('.').last}"
  end
end
