class CreateSavedRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :saved_recipes do |t|
      t.string :name
      t.integer :recipe_id

      t.timestamps
    end
  end
end
