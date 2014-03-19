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

  describe "when echonest_id isn't present" do
  	before { @artist.echonest_id  = nil}
  	it { should_not be_valid }
  end


end
