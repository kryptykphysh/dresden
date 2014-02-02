require 'spec_helper'

describe Character do
  let(:character) { build(:character) }

  subject { character }

  describe 'methods and attributes' do
    it { should respond_to :name }
    it { should respond_to :played_by }
    it { should respond_to :campaign }
    it { should respond_to :power_level }
    it { should respond_to :high_concept }
    it { should respond_to :trouble }

    describe ':name' do
      its(:name) { should be_an_instance_of String }

      describe 'should be titleized' do
        before { character.valid? }

        its(:name) { should == character.name.titleize }
      end

      context 'without a name' do
        before { character.name = '' }

        it { should_not be_valid }
      end

      context 'should be unique' do
        before { create(:character, name: character.name) }

        it { should_not be_valid }
      end
    end

    describe ':played_by' do
      its(:played_by) { should be_an_instance_of User }

      context 'without a :played_by' do
        before { character.played_by = nil }
          
        it { should_not be_valid }
      end
    end

    describe ':campaign' do
      its(:campaign) { should be_an_instance_of Campaign }
    end

    describe ':power_level' do
      its(:power_level) { should be_an_instance_of PowerLevel }
    end

    describe ':high_concept' do
      its(:high_concept) { should be_an_instance_of Aspect }
    end

    describe ':trouble' do
      its(:trouble) { should be_an_instance_of Aspect}
    end
  end
end
