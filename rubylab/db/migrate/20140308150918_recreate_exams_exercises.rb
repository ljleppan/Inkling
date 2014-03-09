class RecreateExamsExercises < ActiveRecord::Migration
  def change
    drop_table :exams_exercises

    create_table :exams_exercises do |t|
      t.integer :exam_id
      t.integer :exercise_id

      t.timestamps
    end
  end
end
