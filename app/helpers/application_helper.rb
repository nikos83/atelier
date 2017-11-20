module ApplicationHelper
  def gravatar_url(email, size)
  gravatar_id = Digest::MD5::hexdigest(email).downcase
  default_url = "http://ksiegarnia-nikodem.c9users.io/guest.png"
  url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=#{CGI::escape(default_url)}"

  end
end
