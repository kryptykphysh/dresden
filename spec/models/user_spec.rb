require 'spec_helper'

describe User do
  subject { create(:user) }

  describe 'methods and attributes' do
    it { should respond_to :gamemastered_campaigns }
    it { should respond_to :played_campaigns }

    describe ':gamemastered_campaigns' do
      subject { create(:user_with_gmd_campaigns) }
      it 'should be a collection of Campaigns' do
        subject.gamemastered_campaigns.all? do |campaign|
          campaign.should be_an_instance_of Campaign
        end
      end
    end

    describe ':played_campaigns' do
      subject { create(:user_with_played_campaigns) }
      it 'should be a collection of Campaigns' do
        subject.played_campaigns.all? do |campaign|
          campaign.should be_an_instance_of Campaign
        end
      end
    end
  end
end
