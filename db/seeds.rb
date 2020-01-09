# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Room.destroy_all
Match.destroy_all
Message.destroy_all
Report.destroy_all
DogImage.destroy_all
Dog.destroy_all
User.destroy_all

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

@dogimage1 = DogImage.create!(dog_id: @dog1.id, image: 'https://images.pexels.com/photos/752383/pexels-photo-752383.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
@dogimage2 = DogImage.create!(dog_id: @dog1.id, image: 'https://images.pexels.com/photos/1959055/pexels-photo-1959055.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
@dogimage3 = DogImage.create!(dog_id: @dog2.id, image: 'https://images.pexels.com/photos/1938125/pexels-photo-1938125.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
@dogimage4 = DogImage.create!(dog_id: @dog3.id, image: 'https://images.pexels.com/photos/1242419/pexels-photo-1242419.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
@dogimage5 = DogImage.create!(dog_id: @dog3.id, image: 'https://images.pexels.com/photos/89781/doberman-dog-animal-world-animal-89781.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
@dogimage6 = DogImage.create!(dog_id: @dog4.id, image: 'https://images.pexels.com/photos/1490908/pexels-photo-1490908.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
@dogimage7 = DogImage.create!(dog_id: @dog4.id, image: 'https://images.pexels.com/photos/92380/pexels-photo-92380.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
@dogimage8 = DogImage.create!(dog_id: @dog4.id, image: 'https://images.pexels.com/photos/1431762/pexels-photo-1431762.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
@dogimage9 = DogImage.create!(dog_id: @dog4.id, image: 'https://images.pexels.com/photos/54199/pexels-photo-54199.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260')
@dogimage10 = DogImage.create!(dog_id: @dog5.id, image: 'https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12230042/Papillon-On-White-01.jpg')
@dogimage11 = DogImage.create!(dog_id: @dog5.id, image: 'http://static.ddmcdn.com/en-us/apl/breedselector/images/breed-selector/dogs/breeds/papillon_01_lg.jpg')
@dogimage12 = DogImage.create!(dog_id: @dog6.id, image: 'https://www.purina.co.uk/sites/g/files/mcldtz2481/files/styles/nppe_breed_selector_500/public/breed_library/chihuahua_smooth_coat.jpg?itok=mvcwMTFj')
@dogimage13 = DogImage.create!(dog_id: @dog7.id, image: 'https://vetstreet.brightspotcdn.com/dims4/default/1d87d20/2147483647/thumbnail/645x380/quality/90/?url=https%3A%2F%2Fvetstreet-brightspot.s3.amazonaws.com%2F3a%2Fc3%2F424ee1bf4768973966bde73acda8%2Fgerman-shepherd-AP-1S7FRX-645sm12913.jpg')
@dogimage14 = DogImage.create!(dog_id: @dog8.id, image: 'https://www.allthingsdogs.com/wp-content/uploads/2019/07/Chocolate-Lab-Names-Feature.jpg')
@dogimage15 = DogImage.create!(dog_id: @dog9.id, image: 'https://www.thesprucepets.com/thmb/6OX0VRYRfXclaryFZUeR-5j-7YA=/960x0/filters:no_upscale():max_bytes(150000):strip_icc()/Stocksy_txpf4e26be2n2x100_Medium_774343-5afafb60c064710036564027.jpg')

@report1 = Report.create!(user_id: @user4.id, description: 'does not have a dog')
@report2 = Report.create!(user_id: @user2.id, description: 'dog is mean')
