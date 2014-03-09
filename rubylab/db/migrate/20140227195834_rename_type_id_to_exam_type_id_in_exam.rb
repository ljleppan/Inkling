class RenameTypeIdToExamTypeIdInExam < ActiveRecord::Migration
  def change
    rename_column :exams, :type_id, :exam_type_id
  end
end
