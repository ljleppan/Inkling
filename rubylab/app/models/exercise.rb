class Exercise < ActiveRecord::Base
  has_and_belongs_to_many :exams

  validates_presence_of :question
end
