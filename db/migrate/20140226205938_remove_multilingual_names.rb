class RemoveMultilingualNames < ActiveRecord::Migration
  def change
    remove_column :courses, :name_en
    rename_column :courses, :name_fi, :name

    remove_column :exam_types, :name_en
    rename_column :exam_types, :name_fi, :name
  end
end
