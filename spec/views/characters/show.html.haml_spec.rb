require 'spec_helper'

describe "characters/show.html.haml" do
  let(:character) { create(:character) }
  subject { page }

  before { visit character_path(character) }

  it { should have_title full_title(character.name) }
  it { should have_selector 'h5', character.name }
  it { should have_link character.name, href: character_path(character) }
  it { should have_selector 'dd', character.description }
  it { should have_link character.campaign.name,
    href: campaign_path(character.campaign) }
  it { should have_selector 'dd', character.campaign.power_level.name }
  it { should have_selector 'dd', character.high_concept.name }
  it { should have_selector 'dd', character.trouble.name }
end
