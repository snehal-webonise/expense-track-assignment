module ApplicationHelper

  def fetch_contributors(members, user)
    members.reject { |member| member.id == user.id }
  end
end
