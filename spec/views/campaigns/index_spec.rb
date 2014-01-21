require 'spec_helper'

describe 'Index Page' do
  before do
    15.times { FactoryGirl.create :campaign }
    visit campaigns_path
  end

  subject { page }

  it { should have_title full_title('Campaigns') }
  it { should have_selector 'h1', 'Campaigns' }
  it { should have_selector 'h2',
        text: "#{Campaign.count} campaigns on system!" }
  it { should have_selector 'ul.pagination', count: 2 }
  it { should have_selector '.panel', count: 10 }

  it { should have_selector 'dt', text: 'Description' }
  it { should have_selector 'dt', text: 'Gamemaster' }
  it { should have_selector 'dt', text: 'Players'}
  it { should have_selector 'dt', text: 'Last Updated' }
end