require 'rails_helper'

RSpec.describe Dog, type: :model do
  describe 'relationships' do
    it { should have_many :dog_images }
    it { should belong_to :user }
  end
end
