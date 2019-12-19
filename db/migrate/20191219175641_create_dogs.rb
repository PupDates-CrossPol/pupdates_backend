class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :sex
      t.string :breed
      t.string :size
      t.integer :age
      t.boolean :fixed
      t.boolean :vaccinated
      t.boolean :good_with_kids
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
