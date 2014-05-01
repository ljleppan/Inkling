class ExamsExercise < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :exam

  validates_uniqueness_of :exercise_id, :scope => [:exam_id]
end