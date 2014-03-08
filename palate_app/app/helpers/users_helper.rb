module UsersHelper

	# Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
   	size = options[:size];
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def taste_profile

  	if current_user.adventurousness_affinity > 0.5
  		@adventurousness = "inventive"
  	else
  		@adventurousness = "classic"
  	end
  	if current_user.instinctiveness_affinity > 0.5
  		@instinctiveness = "visceral"
  	else
  		@instinctiveness = "cerebral"
  	end
  	if current_user.pace_affinity > 0.5
  		@pace = "energetic"
  	else
  		@pace = "reflective"
  	end
  	if current_user.valence_affinity > 0.5
  		@valence = "jovial"
  	else
  		@valence = "enigmatic"
  	end
  	
  end

end
