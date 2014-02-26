class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.integer :points
      t.text :question
      t.text :answer
      t.text :criteria

      t.timestamps
    end
  end
end
