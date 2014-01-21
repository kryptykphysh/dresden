require 'spec_helper'

describe 'Index Page' do
  let(:campaign) { FactoryGirl.create :campaign }
  before { visit campaign_path(campaign) }
  subject { page }

  it { should have_title full_title(campaign.name) }
  it { should have_selector 'h1', text: campaign.name }
  it { should have_selector '.panel', count: 1 }

  it { should have_selector 'dt', text: 'Description' }
  it { should have_selector 'dt', text: 'Gamemaster' }
  it { should have_selector 'dd', text: campaign.gamemaster.name }
  it { should have_selector 'dt', text: 'Players'}
  it "should have a list of the players' names" do
    campaign.players.all? do |player| 
      it { should have_selector 'dd', text: player.name }
    end
  end
  it { should have_selector 'dt', text: 'Last Updated' }
  it { should have_selector 'dd', text: campaign.updated_at.strftime("%A, %F %H:%M") }
end