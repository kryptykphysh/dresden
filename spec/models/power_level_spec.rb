require 'spec_helper'

describe PowerLevel do
  let(:power_level) { build(:power_level) }

  describe 'methods and attributes' do
    subject { power_level }

    it { should respond_to :name }
    it { should respond_to :refresh }
    it { should respond_to :skill_points }
    it { should respond_to :skill_cap }
    it { should respond_to :campaigns }

    its(:name)          { should be_an_instance_of String }
    its(:refresh)       { should be_an_instance_of Fixnum }
    its(:skill_points)  { should be_an_instance_of Fixnum }
    its(:skill_cap)     { should be_an_instance_of SkillLevel }
  end
end
