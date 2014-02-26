class Exam < ActiveRecord::Base
  has_and_belongs_to_many :exercises
  belongs_to :course
  belongs_to :exam_type

  validates_presence_of :date
  validates_presence_of :course_id
  validates_presence_of :type_id
end
