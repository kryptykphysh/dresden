require 'spec_helper'

describe "Static Pages" do
  describe "Homepage" do
    #  let(:locale) { 'en' }
    it "should be the root url" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get root_url
      response.status.should be(200)
    end

    before { visit root_path }
    subject { page }

    it { should have_title 'Order of the Asparagus | Dresden' }
    it { should have_content 'Welcome to the Order of the Asparagus in the '\
                             'Dresdenverse.' }
    it { should have_link 'Campaigns' }
    it { should have_link 'Characters' }

    context 'when not logged in' do
      it { should have_link 'Login with Google' }      
    end

    context 'when logged in' do
      let(:user) { FactoryGirl.create(:user) }
      before do
        login_as(user, scope: :user)
        visit root_path
      end

      it { should have_link user.name }
      it { should have_link 'Sign Out' }
      it { should have_link 'Profile', user_path(user) }

      context 'after logging out' do
        before { click_link 'Sign Out'}

        it { should have_link 'Login with Google' }
      end

      after{ Warden.test_reset! }
    end
  end
end
