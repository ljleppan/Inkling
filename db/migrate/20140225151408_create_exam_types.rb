class CreateExamTypes < ActiveRecord::Migration
  def change
    create_table :exam_types do |t|
      t.string :name_fi
      t.string :name_en
      t.timestamps
    end
  end
end
