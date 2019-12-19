class CreateDogImages < ActiveRecord::Migration[5.2]
  def change
    create_table :dog_images do |t|
      t.string :image
      t.references :dog, foreign_key: true

      t.timestamps
    end
  end
end
