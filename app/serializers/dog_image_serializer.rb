class DogImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :image, :dog_id
end
