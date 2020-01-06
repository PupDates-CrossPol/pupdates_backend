class DogSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :sex, :breed, :size, :age, :fixed, :vaccinated, :good_with_kids, :description, :user_id
end
