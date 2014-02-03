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
  it { should have_title full_title(user.name) }

  context 'with gmd campaigns' do
    let(:user) { create(:user_with_gmd_campaigns) }
    before { visit user_path(user) }

    it { should have_link "#{pluralize(user.gamemastered_campaigns.count,
                          'campaign')} gamemastered",
                          href: '#gamemastered-campaigns-list' }
  end

  context 'with played campaigns' do
    let(:user) { create(:user_with_played_campaigns) }
    before { visit user_path(user) }

    it { should have_link "#{pluralize(user.played_campaigns.count,
                          'campaign')} played",
                          href: '#played-campaigns-list'}
  end

  context 'with played characters' do
    let(:user) { create(:user) }

    before do
      5.times do
        create(:character, played_by: user)
        visit user_path(user)
      end
    end

    it { should have_link "#{pluralize(user.characters.count, 'character')}",
          href: '#played-characters-list' }
    
  end

  after{ Warden.test_reset! }
end