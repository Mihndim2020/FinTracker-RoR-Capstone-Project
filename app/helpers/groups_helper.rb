module GroupsHelper
  def display_eye(expenditure)
    render 'eye' if current_user == expenditure.author
  end

  def display_modify(group)
    render 'modify' if current_user == group.user
  end

  def icon_url_for_group(group)
    group.icon.key.nil? ? 'No-profile-icon.png' : group.icon
  end
end