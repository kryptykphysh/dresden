require 'spec_helper'

describe 'ApplicationHelpers' do
  describe 'full_title' do
    context 'with a provided title' do
     let(:name) { Faker::Company.name }

      subject { helper.full_title(name) }

      it { should == "Order of the Asparagus | #{name}" }
    end

    context 'with no title provided' do
      let(:name) { '' }

      subject { helper.full_title(name) }

      it { should == 'Order of the Asparagus' }
    end    
  end
end