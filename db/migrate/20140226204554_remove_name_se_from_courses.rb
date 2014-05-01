class RemoveNameSeFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :name_se
  end
end
