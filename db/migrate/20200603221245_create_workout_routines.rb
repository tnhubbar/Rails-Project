class CreateWorkoutRoutines < ActiveRecord::Migration[6.0]
  def change
    create_table :workout_routines do |t|

      t.timestamps
    end
  end
end
