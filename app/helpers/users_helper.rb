module UsersHelper
  def cover_picture(user)
    if user.cover_pic.attached?
      image_tag user.cover_pic, class: 'w-100 p-img'
    else
      image_tag 'book2.png', class: 'w-100 p-img'
    end
  end

  def profile_picture(user)
    if user.profile_pic.attached?
      image_tag user.profile_pic, class: 'profile'
    else
      avatar_for(user)
    end
  end

  def tag_picture(user)
    if user.profile_pic.attached?
      image_tag user.profile_pic, class: 'tag_profile'
    else
      avatar_for(user)
    end
  end
end
