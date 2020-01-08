require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'relationships' do
    it { should belong_to :match }
    it { should have_many :messages }
  end
end
