class PalateRecommendation < ActiveRecord::Base

	belongs_to :media, polymorphic: true

	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :content, presence: true, length: { maximum: 200 }
	validates :user_id, presence: true
	validates :media, presence: true

	def self.for_user(user)
	    where("user_id = :user_id",
	          user_id: user.id).take(10).shuffle!
  	end

end
