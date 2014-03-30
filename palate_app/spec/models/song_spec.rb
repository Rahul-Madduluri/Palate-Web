require 'spec_helper'

describe Song do
  
	let(:artist) { FactoryGirl.create(:artist) }
	before do
		# This code is not idiomatically correct.
		@song = artist.songs.build(title: "Holy Grail")
	end

	subject { @song }

	it { should respond_to(:title) }
	it { should respond_to(:artist_id) }
	it { should respond_to(:artist) }


	it { should respond_to(:official_rating) }


	its(:artist) { should eq artist }

	it { should be_valid }

	describe "when artist_id is not present" do
		before { @song.artist_id = nil }
		it { should_not be_valid }
	end


end
