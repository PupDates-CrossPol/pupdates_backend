class User < ApplicationRecord
  has_secure_password validations: false
  has_many :dogs, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :matches, dependent: :destroy
  has_many :messages, dependent: :destroy
end
