class Movie < ActiveRecord::Base

	has_many :user_movies, dependent: :destroy
	has_many :users, through: :user_movies

	validates :title, presence: true
end
