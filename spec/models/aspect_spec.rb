require 'spec_helper'

describe Aspect do
  let(:aspect) { build(:aspect) }

  subject { aspect }

  describe 'methods and attributes' do
    it { should respond_to :name }

    its(:name) { should be_an_instance_of String }

    describe ':name' do
      before { create(:aspect, name: aspect.name) }
      it 'should be unique' do
        

        subject.should_not be_valid
      end

      context 'without a name' do
        before { subject.name = '' }

        it { should_not be_valid }      
      end
    end
  end
end
