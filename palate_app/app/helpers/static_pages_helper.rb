module StaticPagesHelper

	
	def link_urls_and_users(s)

	    #regexps
	    url = /( |^)http:\/\/([^\s]*\.[^\s]*)( |$)/
	    user = /@(\w+)/

	    #replace @usernames with links to that user
	    while s =~ user
	        s.sub! "@#{$1}", "<a href='http://twitter.com/#{$1}' >#{$1}</a>"
	    end

	    #replace urls with links
	    while s =~ url
	        name = $2
	        #match_name = name.gsub("?","\\?") 
	        #match_name = match_name.gsub("&","\\&")
	        s.sub! /( |^)http:\/\/#{name}( |$)/, " <a href='http://#{name}' >#{name}</a> "
	    end



	     s.html_safe

	end


end
