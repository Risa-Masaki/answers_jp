module ApplicationHelper
  def avatar_url(user)
    if user.image
      "http://graph.facebook.com/#{user.uid}/picture?type=large" # facebookの画像があった場合
    else
      "NO IMAGE"
    end
  end
end
