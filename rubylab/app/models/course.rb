class Course < ActiveRecord::Base
  has_many :exams

  validates_length_of :name, minimum: 3
  validates_numericality_of :hy_id, greater_than_or_equal_to: 0

end
