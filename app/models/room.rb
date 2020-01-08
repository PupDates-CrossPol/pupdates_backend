class Room < ApplicationRecord
  belongs_to :match
  has_many :messages 
end
