class PalateRecommendationsController < ApplicationController
  
  	before_action :signed_in_user, only: :create


	def create
		@recommendation = current_user.palate_recommendations.build(recommendation_params)
		if @recommendation.save
	  		#flash[:success] = "Recommendation created!"
	  		redirect_to root_url
		else
			@feed_items = []
	  		render 'static_pages/home'
		end
	end


	private

		def recommendation_params
			params.require(:palate_recommendation).permit(:content)
		end

end