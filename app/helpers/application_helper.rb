module ApplicationHelper
  def avatar_url(user, size)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end
		  def error_messages_for(object)
    render(:partial => 'application/error_messages',
      :locals => {:object => object})
  end
end
