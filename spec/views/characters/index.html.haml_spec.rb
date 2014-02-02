require 'spec_helper'

describe "characters/index.html.haml" do
  subject { page }

  before do
    15.times do
      create(:character)
    end
    visit characters_path
  end

  it { should have_title full_title('Characters') }
  it { should have_selector('h1', 'Characters') }
  it { should have_selector('h2',
    "#{pluralize(Character.count, 'character') } on system") }
  it { should have_selector 'ul.pagination', count: 2 }
  it { should have_selector '.panel', count: 10 }

  it { should have_selector('dt', 'Power Level') }
  it { should have_selector('dt', 'Description') }
  it { should have_selector('dt', 'Last Updated') }
end
