require 'rails_helper'

describe "Users API" do
  before :each do
    @user1 = User.create!(first_name: 'Matt', last_name: 'Malone', email: 'mattmalone@email.com', password: 'password', description: 'a guy who likes dogs', image: 'https://images.pexels.com/photos/736716/pexels-photo-736716.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
    @user2 = User.create!(first_name: 'Sam', last_name: 'Coleman', email: 'samcoleman@email.com', password: 'password', description: 'a guy who from TN likes dogs a lot', image: 'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
    @user3 = User.create!(first_name: 'Andrew', last_name: 'Johnson', email: 'andrewjohnson@email.com', password: 'password', description: 'a guy from SD who likes dogs', image: 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
    @user4 = User.create!(first_name: 'Sara', last_name: 'Karsh', email: 'sarakarsh@email.com', password: 'password', description: 'a girl who likes her dog too much', image: 'https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')

    @dog1 = Dog.create!(user_id: @user1.id, name: 'Fido', sex: 'male', breed: 'golden retriever', size: 'large', age: 4, fixed: true, vaccinated: true, good_with_kids: true)
    @dog2 = Dog.create!(user_id: @user2.id, name: 'Hank', sex: 'male', breed: 'border collie', size: 'medium', age: 1, fixed: false, vaccinated: false, good_with_kids: true)
    @dog3 = Dog.create!(user_id: @user2.id, name: 'Goofy', sex: 'male', breed: 'doberman', size: 'large', age: 5, fixed: true, vaccinated: true, good_with_kids: false)
    @dog4 = Dog.create!(user_id: @user3.id, name: 'Molly', sex: 'female', breed: 'golden retriever', size: 'large', age: 2, fixed: true, vaccinated: true, good_with_kids: true)
    @dog5 = Dog.create!(user_id: @user3.id, name: 'Sparkles', sex: 'female', breed: 'papillon', size: 'small', age: 8, fixed: true, vaccinated: true, good_with_kids: false)
    @dog6 = Dog.create!(user_id: @user3.id, name: 'Fluffy', sex: 'female', breed: 'chihuahua', size: 'very small', age: 12, fixed: false, vaccinated: false, good_with_kids: false)
    @dog7 = Dog.create!(user_id: @user3.id, name: 'Larry', sex: 'male', breed: 'german shepherd', size: 'large', age: 5, fixed: true, vaccinated: true, good_with_kids: true)
    @dog8 = Dog.create!(user_id: @user4.id, name: 'Oliver', sex: 'male', breed: 'chocolate lab', size: 'large', age: 1, fixed: true, vaccinated: true, good_with_kids: true)
    @dog9 = Dog.create!(user_id: @user4.id, name: 'Tallulah', sex: 'female', breed: 'mutt', size: 'medium', age: 6, fixed: true, vaccinated: true, good_with_kids: false)
  end

  it "gets all users" do

    get '/api/v1/users'

    expect(response).to be_successful

    users = JSON.parse(response.body)

    expect(users['data'].count).to eq(4)
  end

  it "gets a single user" do

    get "/api/v1/users/#{@user1.id}"

    expect(response).to be_successful

    user = JSON.parse(response.body)

    expect(user['data']['attributes']['id']).to eq(@user1.id)
  end

  it "gets all dogs for a single user" do

    get "/api/v1/users/#{@user4.id}/dogs"

    expect(response).to be_successful

    users_dogs = JSON.parse(response.body)

    expect(users_dogs['data'].first['attributes']['name']).to eq('Oliver')
    expect(users_dogs['data'].last['attributes']['name']).to eq('Tallulah')
  end

  it "A user can add a dog" do
    post "/api/v1/users/#{@user4.id}/dogs?name=Zoe&sex=female&breed=mutt&size=medium&age=4&fixed=true&vaccinated=true&good_with_kids=true"

    expect(response).to be_successful

    new_dog = JSON.parse(response.body)

    expect(new_dog['data'].last['attributes']['name']).to eq('Zoe')
  end

  it "A user can update their image" do

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)

    patch "/api/v1/users/#{@user2.id}?image=https://firebasestorage.googleapis.com/v0/b/pupdates-b3204.appspot.com/o/images%2Foc1qeaq1t?alt=media&token=e42c5645-1315-4cb7-831b-67c426ae3242"

    expect(response).to be_successful

    get "/api/v1/users/#{@user2.id}"

    updated_image = JSON.parse(response.body)

    expect(updated_image['data']['attributes']['image']).to eq('https://firebasestorage.googleapis.com/v0/b/pupdates-b3204.appspot.com/o/images/oc1qeaq1t?alt=media&token=e42c5645-1315-4cb7-831b-67c426ae3242')
  end
end
