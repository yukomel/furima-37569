class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
      t.index [:user_id, :product_id], unique: true 
    end
  end
end
