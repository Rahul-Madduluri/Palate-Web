module UsersHelper

	# Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, options = { size: 50 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
   	size = options[:size];
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def display_profile_bits
 

  	if (current_user.adventurousness_affinity > 0.5)
  		first_letter = "I"
  	else
  		first_letter = "C"
  	end
  	if (current_user.instinctiveness_affinity > 0.5)
  		second_letter = "V"
  	else
  		second_letter = "Ce"
  	end
  	if (current_user.pace_affinity > 0.5)
  		third_letter = "E"
  	else
  		third_letter = "R"
  	end
  	if (current_user.valence_affinity > 0.5)
  		fourth_letter = "J"
  	else
  		fourth_letter = "En"
  	end

  	profile_bits = first_letter + second_letter + third_letter + fourth_letter
  	profile_bits


  end
 

end
