require 'spec_helper'

describe User do
  subject { FactoryGirl.create(:user) }

  describe 'methods and attributes' do
    it { should respond_to :gamemastered_campaigns }
  end
end
