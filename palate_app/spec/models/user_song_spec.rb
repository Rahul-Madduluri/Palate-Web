require 'spec_helper'

describe UserSong do
	let (:user) { FactoryGirl.create(:user) }
	let (:song) { FactoryGirl.create(:song) }
	let (:user_song) { user.user_songs.build(song_id: song.id)  }

	subject { user_song }

	it { should be_valid }

	describe "user-song relationship methods" do

		it { should respond_to (:user) }
		it { should respond_to (:song) }
		it { should respond_to (:personal_rating) }
		its(:user) { should eq user }
		its(:song) { should eq song }

	end

	describe "when user_id is not present" do
		before { user_song.user_id = nil }
		it { should_not be_valid }
	end

	describe "when song_id is not present" do
		before { user_song.song_id = nil }
		it { should_not be_valid }
	end
end
