class User < ApplicationRecord
  has_secure_password validations: false
  has_many :dogs, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :matches, dependent: :destroy
  has_many :messages, dependent: :destroy


  def current_user_likes
    likes = self.matches.where(status: "like")
    new_likes = likes.map do |like|
      like.match_id
    end
    new_likes
  end

  def mutual_matches
    Match.where(user_id: current_user_likes).pluck(:user_id)
  end

  def user_matches
    matches = self.mutual_matches
    User.where(id: matches)
  end
end
