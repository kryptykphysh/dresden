require 'spec_helper'

describe CharacterPhase do
  let(:character_phase) { build(:character_phase) }

  subject { character_phase}

  describe 'methods and attributes' do
    it { should respond_to :character }
    it { should respond_to :phase }
    it { should respond_to :aspect }
    it { should respond_to :guest_star }

    describe ':character' do
      its(:character) { should be_an_instance_of Character }

      context 'without a :character_id' do
        before { character_phase.character_id = nil }

        it { should_not be_valid }   
      end
    end

    describe ':phase' do
      its(:phase) { should be_an_instance_of Phase }

      context 'without a :phase_id' do
        before { character_phase.phase_id = nil }

        it { should_not be_valid }
      end      
    end

    context 'should have a unique combination of :character_id and :phase_id' do
      before do
        create(:character_phase,
                character_id: character_phase.character_id,
                phase_id:     character_phase.phase_id
              )
      end

      it { should_not be_valid }
    end
  end
end
