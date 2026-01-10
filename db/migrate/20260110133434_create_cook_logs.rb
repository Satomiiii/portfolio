class CreateCookLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :cook_logs do |t|
      t.references :dish, null: false, foreign_key: true
      t.integer :trial_number
      t.text :reflection
      t.text :next_plan

      t.timestamps
    end
  end
end
