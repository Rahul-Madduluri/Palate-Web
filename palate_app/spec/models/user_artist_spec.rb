require 'spec_helper'

describe UserArtist do
  
	let (:user) { FactoryGirl.create(:user) }
	let (:artist) { FactoryGirl.create(:artist) }
	let (:user_artist) { user.user_artists.build(artist_id: artist.id)  }

	subject { user_artist }

	it { should be_valid }

	describe "user-artist relationship methods" do

		it { should respond_to (:user) }
		it { should respond_to (:artist) }
		its(:user) { should eq user }
		its(:artist) { should eq artist }

	end

	describe "when user_id is not present" do
		before { user_artist.user_id = nil }
		it { should_not be_valid }
	end

	describe "when artist_id is not present" do
		before { user_artist.artist_id = nil }
		it { should_not be_valid }
	end

end
