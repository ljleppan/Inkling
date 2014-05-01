require 'spec_helper'

describe Exam do

  it 'should belong to a course' do
    exam = Exam.new course_id:1
    exam.course_id.should be 1
  end

  it 'should have a type' do
    exam = Exam.new exam_type_id:1
    exam.exam_type_id.should be 1
  end

  it 'saves with all required data' do
    exam = Exam.create course_id:1, date:Date.today, exam_type_id:1
    exam.should be_valid
    Exam.count.should be 1
  end

  it 'does not save without a proper course_id' do
    exam = Exam.create date:Date.today, exam_type_id:1
    exam.should_not be_valid
    Exam.count.should be 0
  end

  it 'does not save without a proper date' do
    exam = Exam.create course_id:1, exam_type_id:1
    exam.should_not be_valid
    Exam.count.should be 0
  end

  it 'does not save without a proper exam_type_id' do
    exam = Exam.create course_id:1, date:Date.today
    exam.should_not be_valid
    Exam.count.should be 0
  end

  it 'should have a to_s method' do
    course = Course.create name:'Ohjelmoinnin perusteet', hy_id:1111
    exam_type = ExamType.create name:'Kurssikoe'
    exam = Exam.create course:course, date:Date.today, exam_type:exam_type
    exam.to_s.should eq "Ohjelmoinnin perusteet - Kurssikoe - #{Date.today.to_s(:db)}"
  end
end
