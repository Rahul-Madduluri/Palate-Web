require 'spec_helper'

describe UserMovie do
  
	let (:user) { FactoryGirl.create(:user) }
	let (:movie) { FactoryGirl.create(:movie) }
	let (:user_movie) { user.user_movies.build(movie_id: movie.id)  }

	subject { user_movie }

	it { should be_valid }

	describe "user-movie relationship methods" do

		it { should respond_to (:user) }
		it { should respond_to (:movie) }
		its(:user) { should eq user }
		its(:movie) { should eq movie }

	end

	describe "when user_id is not present" do
		before { user_movie.user_id = nil }
		it { should_not be_valid }
	end

	describe "when movie_id is not present" do
		before { user_movie.movie_id = nil }
		it { should_not be_valid }
	end

end
