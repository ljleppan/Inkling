require 'spec_helper'

describe Course do
  it 'has a name' do
    course = Course.new name:'Ohjelmoinnin perusteet'
    course.name.should eq 'Ohjelmoinnin perusteet'
  end

  it 'has a HY-ID' do
    course = Course.new hy_id:1111
    course.hy_id.should be 1111
  end

  it 'should be saved with a valid name and HY-ID' do
    course = Course.create name:'Ohjelmoinnin perusteet', hy_id:1111
    course.should be_valid
    Course.count.should be 1
  end

  it 'should not be saved with an invalid name' do
    course = Course.create name:'a', hy_id:'1111'
    course.should_not be_valid
    Course.count.should be 0
  end

  it 'should not be saved with an invalid HY-ID' do
    course = Course.create name:'Ohjelmoinnin perusteet', hy_id:'asdasd'
    course.should_not be_valid
    Course.count.should be 0
  end

  it 'should have a working to_s' do
    course = Course.create name:'Ohjelmoinnin perusteet', hy_id:1111
    course.to_s.should eq 'Ohjelmoinnin perusteet'
  end
end
