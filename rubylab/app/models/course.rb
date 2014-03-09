class Course < ActiveRecord::Base
  has_many :exams
  has_many :exercises, :through => :exams

  validates_length_of :name, minimum: 3
  validates_numericality_of :hy_id, greater_than_or_equal_to: 0

  scope :active, -> { where active:true }
  scope :inactive, -> { where active:[nil,false] }

  def to_s
    name
  end

end
