require 'spec_helper'

describe SkillLevel do
  let(:skill_level) { build(:skill_level) }

  describe 'methods and attributes' do
    subject { skill_level }

    it { should respond_to :name }
    it { should respond_to :modifier }

    its(:name)      { should be_an_instance_of String }
    its(:modifier)  { should be_an_instance_of Fixnum }
  end

  describe 'collection order' do
    it 'should be in ascending :modifier order' do
      skill_levels = SkillLevel.all.pluck(:modifier)
      skill_levels.should == skill_levels.sort
    end
  end
end
