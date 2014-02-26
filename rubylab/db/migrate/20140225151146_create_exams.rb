class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.integer :course_id
      t.date :date
      t.integer :type

      t.timestamps
    end
  end
end
