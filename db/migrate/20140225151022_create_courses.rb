class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name_fi
      t.string :name_en
      t.string :name_se
      t.string :hy_id
      t.boolean :active

      t.timestamps
    end
  end
end
