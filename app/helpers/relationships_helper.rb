module RelationshipsHelper
  def follow_button(user)
    return if current_user == user

    if current_user.followings.exists?(user.id)
      form_with url: relationship_path(user), method: :delete do |form|
        form.submit 'Unfollow',
                    class: ' px-4 py-1 bg-primary text-light rounded-pill text-red-500 border rounded-full btn-sm'
      end
    else
      form_with url: user_relationships_path(user) do |form|
        form.submit 'Follow',
                    class: ' px-4 py-1 bg-primary text-light rounded-pill text-red-500 border btn-sm rounded-full '
      end
    end
  end
end
