require 'spec_helper'

describe "characters/show.html.haml" do
  let(:character) { create(:character) }
  subject { page }

  before { visit character_path(character) }

  it { should have_title full_title(character.name) }
  it { should have_selector 'h5', character.name }
end
