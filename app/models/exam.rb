class Exam < ActiveRecord::Base
  has_many :exams_exercises
  has_many :exercises, :through => :exams_exercises
  belongs_to :course
  belongs_to :exam_type

  validates_presence_of :date
  validates_presence_of :course_id
  validates_presence_of :exam_type_id

  def to_s
    "#{course.name} - #{exam_type.name} - #{date}"
  end
end
