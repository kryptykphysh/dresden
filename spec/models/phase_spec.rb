require 'spec_helper'

describe Phase do
  let(:phase) { create(:phase) }

  subject { phase }

  describe 'methods and attributes' do
    it { should respond_to :name }
    it { should respond_to :question }

    its(:name) { should be_an_instance_of String }
    its(:question) { should be_an_instance_of String }
  end
end
