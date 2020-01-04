class Dog < ApplicationRecord
  belongs_to :user
  has_many :dog_images, dependent: :destroy
end
