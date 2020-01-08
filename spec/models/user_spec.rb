require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many :dogs }
    it { should have_many :messages }
    it { should have_many :reports }
    it { should have_many :matches }
  end


  describe "class methods" do
    before :each do
      @user1 = User.create!(first_name: 'Matt', last_name: 'Malone', email: 'mattmalone@email.com', password: 'password', description: 'a guy who likes dogs', image: 'https://images.pexels.com/photos/736716/pexels-photo-736716.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
      @user2 = User.create!(first_name: 'Sam', last_name: 'Coleman', email: 'samcoleman@email.com', password: 'password', description: 'a guy who from TN likes dogs a lot', image: 'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
      @user3 = User.create!(first_name: 'Andrew', last_name: 'Johnson', email: 'andrewjohnson@email.com', password: 'password', description: 'a guy from SD who likes dogs', image: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
      @user4 = User.create!(first_name: 'Sara', last_name: 'Karsh', email: 'sarakarsh@email.com', password: 'password', description: 'a girl who likes her dog too much', image: 'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')

      @match1 = Match.create!(user_id: @user1.id, match_id: @user2.id, status: "like")
      @match2 = Match.create!(user_id: @user1.id, match_id: @user3.id, status: "like")
      @match3 = Match.create!(user_id: @user1.id, match_id: @user4.id, status: "dislike")
      @match3 = Match.create!(user_id: @user2.id, match_id: @user1.id, status: "like")
    end

    it "current users likes" do
      expect(@user1.current_user_likes.count).to eq(2)
    end

    it "matched users likes" do
      expect(@user1.mutual_matches.count).to eq(1)
    end

    it "displays matches" do

      expect(@user1.user_matches).to eq([@user2])
    end
  end
end
