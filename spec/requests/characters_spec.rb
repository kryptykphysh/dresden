require 'spec_helper'

describe 'Characters' do
  subject { page }

  describe 'creating a new Character' do
    context 'when logged in' do
      let(:user) { create(:user) }
      let(:campaign) { create(:campaign) }
      let(:name) { 'Yet Another Test Character' }
      let(:description) { Faker::Lorem.paragraphs(2).join("\n\n") }

      before do
        login_as(user, scope: :user)
        visit new_character_path
        fill_in 'character_name', with: name
        fill_in 'character_description', with: description
        click_button 'Create Character'
      end

      it 'should redirect to Character show page' do
        current_path.should == character_path(Character.where("name = ?", name.downcase).first.id)
      end   
    end

    context 'when not logged in' do
      before { visit new_character_path }

      it 'should redirect to home page' do
        current_path.should == root_path
      end

      it 'should display a login alert' do
        alert = subject.find_by_id('flash_alert')
        alert.should have_content 'You need to sign in or sign up before ' \
                                  'continuing.'
      end
    end
  end
end