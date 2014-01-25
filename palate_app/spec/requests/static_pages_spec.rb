require 'spec_helper'

describe "StaticPages" do

  describe "Not signed in home page" do

    it "should have the content 'Palate'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/static_pages/home'
      expect(page).to have_title('Palate | Home')
    end
  end
end
