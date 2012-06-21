module UsersHelper
	# Returns the Gravatar (http://gravatar.com/) for the given user.
	# MD5 hashes are case sensitive so downcase everything
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end
