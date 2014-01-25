require 'spec_helper'

describe 'User show page' do
  let(:user) { FactoryGirl.create(:user) }
  subject { page }

  before do
    login_as(user, scope: :user)
    visit user_path(user)
  end    

  it { should have_link 'Profile', user_path(user) }
  it { should have_link 'Sign Out' }
  it { should_not have_link 'Login with Google' }
  it { should have_title user.name }
  it { should have_content 'Gamemastered' }
  it { should have_content 'Played' }

  context 'with gmd campaigns' do
    let(:user) { create(:user_with_gmd_campaigns) }
    before { visit user_path(user) }

    it { should have_link "#{pluralize(user.gamemastered_campaigns.count,
                          'campaign')}", href: '#' }
  end

  context 'with played campaigns' do
    let(:user) { create(:user_with_played_campaigns) }
    before { visit user_path(user) }

    it { should have_link "#{pluralize(user.played_campaigns.count,
                          'campaign')}", href: '#'}
  end

  after{ Warden.test_reset! }
end