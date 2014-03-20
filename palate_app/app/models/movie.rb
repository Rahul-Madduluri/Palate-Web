class Movie < ActiveRecord::Base

	has_many :user_movies, dependent: :destroy
	has_many :users, through: :user_movies

	has_many :palate_recommendations, as: :media

	validates :title, presence: true
end
