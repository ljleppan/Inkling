class ExamType < ActiveRecord::Base
  has_many :exams

  validates_uniqueness_of :name

  def to_s
    name
  end
end
