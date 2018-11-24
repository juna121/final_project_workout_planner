class CreatePerformances < ActiveRecord::Migration[5.1]
  def change
    create_table :performances do |t|
      t.integer :workout_id
      t.integer :reps
      t.integer :sets
      t.string :weight
      t.integer :exercise_id

      t.timestamps
    end
  end
end
