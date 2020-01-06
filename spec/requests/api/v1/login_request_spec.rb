require 'rails_helper'

describe "Logining into the API" do
  it "As a visitor I can log into the app via email" do
    @user1 = User.create!(id: 1, first_name: 'Matt', last_name: 'Malone', email: 'mattmalone@email.com', description: 'a guy who likes dogs', image: 'https://images.pexels.com/photos/736716/pexels-photo-736716.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
    @user2 = User.create!(id: 2, first_name: 'Sam', last_name: 'Coleman', email: 'samcoleman@email.com', description: 'a guy who from TN likes dogs a lot', image: 'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
    @user3 = User.create!(id: 3, first_name: 'Andrew', last_name: 'Johnson', email: 'andrewjohnson@email.com', description: 'a guy from SD who likes dogs', image: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
    @user4 = User.create!(id: 4, first_name: 'Sara', last_name: 'Karsh', email: 'sarakarsh@email.com', description: 'a girl who likes her dog too much', image: 'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')

    post "/api/v1/login/#{@user2.email}"

    expect(response).to be_successful
  end
end
