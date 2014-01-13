require 'spec_helper'

describe "Static Pages" do
  describe "Homepage" do
    #  let(:locale) { 'en' }
    it "should be the root url" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get root_url
      response.status.should be(200)
    end

    before { visit root_url }
    subject { page }

    it { should have_title 'Order of the Asparagus: Dresden Files' }
    it { should have_link 'Login' }
    it { should have_content 'Welcome to the Order of the Asparagus in the '\
                             'Dresdenverse.' }
  end
end
