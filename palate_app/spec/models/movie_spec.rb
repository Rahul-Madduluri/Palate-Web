require 'spec_helper'

describe Movie do
  
  let(:user) { FactoryGirl.create(:user) }
  before do
    @movie = FactoryGirl.create(:movie)
  end

  subject { @movie }

  it { should respond_to(:title) }
  it { should respond_to(:year) }
  it { should respond_to(:url) }

  it { should respond_to(:critics_rating) }
  it { should respond_to(:adventurousness) }
  it { should respond_to(:instinctiveness) }
  it { should respond_to(:pace) }
  it { should respond_to(:valence) }
  it { should respond_to(:freshness) }





  it { should respond_to(:users) }

  describe "when title isn't present" do
  	before { @movie.title  = nil}
  	it { should_not be_valid }
  end

end
