require 'rails_helper'

describe 'Matches API' do
  before :each do
    @user1 = User.create!(first_name: 'Matt', last_name: 'Malone', email: 'mattmalone@email.com', password: 'password', description: 'a guy who likes dogs', image: 'https://images.pexels.com/photos/736716/pexels-photo-736716.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
    @user2 = User.create!(first_name: 'Sam', last_name: 'Coleman', email: 'samcoleman@email.com', password: 'password', description: 'a guy who from TN likes dogs a lot', image: 'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
    @user3 = User.create!(first_name: 'Andrew', last_name: 'Johnson', email: 'andrewjohnson@email.com', password: 'password', description: 'a guy from SD who likes dogs', image: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
    @user4 = User.create!(first_name: 'Sara', last_name: 'Karsh', email: 'sarakarsh@email.com', password: 'password', description: 'a girl who likes her dog too much', image: 'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
  end

  it "A user can match with another user based on likes" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

    post "/api/v1/users/#{@user1.id}/matches", params: { "match_id": "#{@user3.id}", "status": "like" }
    post "/api/v1/users/#{@user1.id}/matches", params: { "match_id": "#{@user2.id}", "status": "like" }
    post "/api/v1/users/#{@user1.id}/matches", params: { "match_id": "#{@user4.id}", "status": "dislike" }
    post "/api/v1/users/#{@user2.id}/matches", params: { "match_id": "#{@user1.id}", "status": "like" }

    expect(response).to be_successful

    match = JSON.parse(response.body)

    expect(match['data']['attributes']['match_id']).to eq(@user1.id)

    get "/api/v1/users/#{@user1.id}/matches"

    matches = JSON.parse(response.body)
    
    expect(matches['data'].count).to eq(1)
  end
end
