require 'spec_helper'

describe "Artist" do

  let(:user) { FactoryGirl.create(:user) }
  before do
    @artist = FactoryGirl.create(:artist)
  end

  subject { @artist }

  it { should respond_to(:name) }
  it { should respond_to(:twitter_handle) }
  it { should respond_to(:echonest_id) }
  it { should respond_to(:image_url) }

  it { should respond_to(:users) }

  #songs
  it { should respond_to(:songs) }

  describe "when echonest_id isn't present" do
  	before { @artist.echonest_id  = nil}
  	it { should_not be_valid }
  end

  describe "song associations" do

    before { @artist.save }
    let!(:older_song) do
      FactoryGirl.create(:song, artist: @artist, created_at: 1.day.ago)
    end
    let!(:newer_song) do
      FactoryGirl.create(:song, artist: @artist, created_at: 1.hour.ago)
    end

    it "should have the right song in the right order" do
      expect(@artist.songs.to_a).to eq [newer_song, older_song]
    end

    it "should destroy associated songs" do
      songs = @artist.songs.to_a
      @artist.destroy
      expect(songs).not_to be_empty
      songs.each do |song|
        expect(Song.where(id: song.id)).to be_empty
      end
    end
    
  end

  


end
