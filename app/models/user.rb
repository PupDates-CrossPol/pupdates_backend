class User < ApplicationRecord
  has_many :dogs
  has_many :reports
  has_many :matches
  has_many :messages
end
