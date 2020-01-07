require 'rails_helper'

describe "Dogs API" do
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

  it "gets all dogs" do

    get '/api/v1/dogs'

    expect(response).to be_successful

    dogs = JSON.parse(response.body)

    expect(dogs['data'].count).to eq(9)
  end
end
