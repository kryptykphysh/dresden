require 'spec_helper'

describe 'New Page' do
  let(:user) { FactoryGirl.create(:user) }

  before do
    login_as(user, scope: :user)
    visit new_campaign_path
  end

  subject { page }

  it { should have_title full_title('New Campaign') } 
  it { should have_selector 'h1', 'New Campaign' }
  it { should have_field 'campaign_name' }
  it { should have_field 'campaign_description' }
  it { should have_selector 'input', exact: 'Create Campaign' }
end