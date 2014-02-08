require 'spec_helper'

describe 'Character#new page' do
  let(:user) { create(:user) }
  subject { page }

  before do
    login_as(user, scope: :user)
    visit new_character_path
  end

  it { should have_title full_title('New Character') }
  it { should have_selector 'h1', 'New Character' }
  it { should have_field 'Name' }
  it { should have_field 'Description' }
  it { should have_field 'Campaign' }
  it { should have_field 'High Concept' }
  it { should have_field 'Trouble' }
end