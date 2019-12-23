require 'rails_helper'

RSpec.describe DogImage, type: :model do
  describe 'relationships' do
    it { should belong_to :dog }
  end
end
