class AddExamsExercisesJoinTable < ActiveRecord::Migration
  def change
    create_join_table :exams, :exercises
  end
end
