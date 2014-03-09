require 'spec_helper'

describe ExamType do

  it 'should have a name' do
    exam_type = ExamType.new name:'Kurssikoe'
    exam_type.name.should eq 'Kurssikoe'
  end

  it 'should save with unique name' do
    exam_type = ExamType.create name:'Kurssikoe'
    exam_type.should be_valid
    ExamType.count.should be 1
  end

  it 'should not save with a non-unique name' do
    ExamType.create name:'Kurssikoe'
    exam_type = ExamType.create name:'Kurssikoe'
    exam_type.should_not be_valid
    ExamType.count.should be 1
  end

  it 'should have a proper to_s method' do
    exam_type = ExamType.create name:'Kurssikoe'
    exam_type.to_s.should eq 'Kurssikoe'
  end
end
