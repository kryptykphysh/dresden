require 'spec_helper'

describe Campaign do
  before(:all) do
    15.times { create :campaign }
  end

  subject { build(:campaign) }

  describe 'methods and attributes' do
    it { should respond_to :name }
    it { should respond_to :description }
    it { should respond_to :gamemaster }
    it { should be_valid }

    context 'without a name' do
      before { subject.name = '' }

      it { should_not be_valid }
    end

    context 'without a description' do
      before { subject.description = '' }

      it { should_not be_valid }    
    end

    context 'without a :gamemaster' do
      before { subject.gamemaster_id = nil }

      it { should_not be_valid }      
    end

    describe ':name' do
      its(:name) { should be_an_instance_of String }      
    end

    describe ':description' do
      its(:description) { should be_an_instance_of String }      
    end

    describe ':gamemaster' do
      its(:gamemaster) { should be_an_instance_of User }
    end
  end

  it "should have a default scope of updated_at descending" do
    Campaign.all.pluck(:id).should == 
      Campaign.order(updated_at: :desc).pluck(:id)
  end
end
