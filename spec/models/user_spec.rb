require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many :dogs }
    it { should have_many :messages }
    it { should have_many :reports }
    it { should have_many :matches }
  end
end
