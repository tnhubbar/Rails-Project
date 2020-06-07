class CreateWorkoutRoutines < ActiveRecord::Migration[6.0]
  def change
    create_table :workout_routines do |t|
      t.string :name
      t.text :description  
      t.integer :user_id
      t.integer :category_id 

      t.timestamps
    end
  end
end
