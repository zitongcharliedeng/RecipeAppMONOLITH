class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|

      t.references :user, null: false, foreign_key: true # automaticaclly assumes id since it cannot be updated
      
      t.string :title
      # cover image from active storage
      t.text :instructions
      t.text :ingredients
      # photos in other place
      
      t.timestamps
    end
  end
end
