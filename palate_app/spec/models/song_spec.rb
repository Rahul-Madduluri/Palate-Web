require 'spec_helper'

describe Song do
  
	let(:artist) { FactoryGirl.create(:artist) }
	before do
		# This code is not idiomatically correct.
		@song = artist.songs.build(title: "Holy Grail", echonest_id: "sldkfj")

	end

	subject { @song }

	it { should respond_to(:title) }
	it { should respond_to(:artist_id) }
	it { should respond_to(:artist) }
	it { should respond_to(:echonest_id) }
	it { should respond_to(:spotify_uri) }


	it { should respond_to(:official_rating) }


	its(:artist) { should eq artist }

	it { should be_valid }

	describe "when artist_id is not present" do
		before { @song.artist_id = nil }
		it { should_not be_valid }
	end

	describe "when echonest_id is not present" do
		before { @song.echonest_id  = nil }
		it { should_not be_valid }
	end


	describe "when multiple songs with same title and artist" do
		before do
			@same_song = artist.songs.build(title: "Holy Grail")
		end

		subject { @same_song }
		it { should_not be_valid }

	end


end
