class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.text :introduce
      t.string :image_id
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end
end
