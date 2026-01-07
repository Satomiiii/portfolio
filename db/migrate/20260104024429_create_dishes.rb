class CreateDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :dishes do |t|
      t.string :name, null: false
      t.string :category, null: false
      t.text :memo

      t.timestamps
    end

    add_index :dishes, :name
    add_index :dishes, :category
  end
end
