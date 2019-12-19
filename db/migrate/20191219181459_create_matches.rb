class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.references :user, foreign_key: true
      t.bigint :match_id

      t.timestamps
    end

    add_foreign_key :matches, :users, column: :match_id
    add_index :matches, [:user_id, :match_id], unique: true
  end
end
