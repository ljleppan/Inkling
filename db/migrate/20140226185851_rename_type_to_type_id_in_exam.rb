class RenameTypeToTypeIdInExam < ActiveRecord::Migration
  def change
    rename_column :exams, :type, :type_id
  end
end
