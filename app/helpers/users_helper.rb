module UsersHelper
    def get_avatar_for user, options = {size: Settings.user.avatar_size}
    width = options[:size]
    height = options[:size]
    avatar_url = if user.avatar?
                   user.avatar.url
                 else
                     Settings.user.default_avatar
                 end
    image_tag avatar_url,
      alt: user.name,
      class: "gravatar rounded-circle",
      id: "img_prev",
      width: width,
      height: height
  end
end
