require 'spec_helper'

describe 'Campaigns' do
  before { 15.times { FactoryGirl.create(:campaign) } }
  subject { page }

  describe 'index page' do
    before do
      c = Campaign.find(15)
      c.update_attribute(:updated_at, Time.now + 1.day)
      c.save

      visit campaigns_path
    end

    it { should have_title full_title('Campaigns') }
    it { should have_link Campaign.find(50).name }
    it { should have_content 'Description' }
    it { should have_selector 'h2', 
      text: "#{pluralize(Campaign.count, 'campaign')} on system!"}
    it { should have_selector '.panel', count: 10 }
  end

  context 'when not signed in' do
    it { should_not have_link 'Create A New Campaign', 
      href: new_campaign_path }
  end

  context 'when signed in' do
    let(:user) { FactoryGirl.create(:user) }
    before do
      login_as(user, scope: :user)
      visit campaigns_path
    end

    it { should have_link 'Create A New Campaign', href: new_campaign_path }
  end

  describe 'new Campaign page' do
    context 'when not signed in' do
      before do
        visit new_campaign_path
      end

      it 'redirects to root_path' do
        current_path.should == root_path
      end

      it { should have_link 'Login with Google' }

      it 'should display an alert' do
        alert = page.find_by_id('flash_alert')
        alert.should have_content 'You need to sign in or sign up before ' \
          'continuing.'
      end
    end

    context 'when signed in' do
      let(:user) { FactoryGirl.create(:user) }
      before do
        login_as(user, scope: :user)
        visit new_campaign_path
      end

      it { should have_link "#{user.name}" }
      it { should_not have_link 'Login with Google' }
      it { should have_title full_title('New Campaign') }
      it { should have_selector '#campaign_name' }
      it { should have_selector '#campaign_description' }
      it { should have_button 'Create Campaign' }

      after(:all) { Warden.test_reset! }     
    end
  end
end
