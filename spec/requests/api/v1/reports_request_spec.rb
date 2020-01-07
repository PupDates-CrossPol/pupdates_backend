require 'rails_helper'

describe "Reports API" do
  before :each do
    @user1 = User.create!(id: 1, first_name: 'Matt', last_name: 'Malone', email: 'mattmalone@email.com', password: 'password', description: 'a guy who likes dogs', image: 'https://images.pexels.com/photos/736716/pexels-photo-736716.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
    @user2 = User.create!(id: 2, first_name: 'Sam', last_name: 'Coleman', email: 'samcoleman@email.com', password: 'password', description: 'a guy who from TN likes dogs a lot', image: 'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
    @user3 = User.create!(id: 3, first_name: 'Andrew', last_name: 'Johnson', email: 'andrewjohnson@email.com', password: 'password', description: 'a guy from SD who likes dogs', image: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
    @user4 = User.create!(id: 4, first_name: 'Sara', last_name: 'Karsh', email: 'sarakarsh@email.com', password: 'password', description: 'a girl who likes her dog too much', image: 'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')

    @report1 = Report.create!(id: 1, user_id: 4, description: 'does not have a dog')
    @report2 = Report.create!(id: 2, user_id: 2, description: 'dog is mean')
  end

  it "Gets a list of all reports" do
    get "/api/v1/reports"

    expect(response).to be_successful

    all_reports = JSON.parse(response.body)

    expect(all_reports['data'].first['attributes']['description']).to eq("does not have a dog")
  end

  it "Creates a new report" do
    post "/api/v1/reports?user_id=3&description=No good doggos"

    expect(response).to be_successful

    get "/api/v1/reports"

    all_reports = JSON.parse(response.body)

    expect(all_reports['data'].last['attributes']['description']).to eq('No good doggos')
  end
end
