require 'spec_helper'

describe PalateRecommendation do
  
	let(:user) { FactoryGirl.create(:user) }
	before { @recommendation = user.palate_recommendations.build(content: "Blank recommendation") }

	subject { @recommendation }

	it { should respond_to(:content) }
	it { should respond_to(:user_id) }
	it { should respond_to(:user) }
	it { should respond_to(:media) }
	its(:user) { should eq user }
	it { should be_valid }


	describe "when user_id is not present" do
		before { @recommendation.user_id = nil }
		it { should_not be_valid }
	end

	describe "with blank content" do
		before { @recommendation.content = " " }
		it { should_not be_valid }
	end

	describe "with content that is too long" do
		before { @recommendation.content = "a" * 141 }
		it { should_not be_valid }
	end


end
