require 'spec_helper'

describe Exercise do
  it 'should have a point value assigned' do
    exercise = Exercise.new points:1
    exercise.points.should be 1
  end

  it 'should have a question' do
    exercise = Exercise.new question:'question'
    exercise.question.should eq 'question'
  end

  it 'should have an answer' do
    exercise = Exercise.new answer:'answer'
    exercise.answer.should eq 'answer'
  end

  it 'should have a scoring criteria' do
    exercise = Exercise.new criteria:'criteria'
    exercise.criteria.should eq 'criteria'
  end

  it 'should save with all field filled' do
    exercise = Exercise.create points:1, question:'question', answer:'answer', criteria:'criteria'
    exercise.should be_valid
    Exercise.count.should be 1
  end

  it 'should save with only required fields filled' do
    exercise = Exercise.create points:1, question:'question'
    exercise.should be_valid
    Exercise.count.should be 1
  end

  it 'should not save without a points value' do
    exercise = Exercise.create question:'question'
    exercise.should_not be_valid
    Exercise.count.should be 0
  end

  it 'should not save without a question' do
    exercise = Exercise.create points:0
    exercise.should_not be_valid
    Exercise.count.should be 0
  end

  it 'should not save with negative points' do
    exercise = Exercise.create points:-1
    exercise.should_not be_valid
    Exercise.count.should be 0
  end

  it 'should not save if the question contains HTML' do
    exercise = Exercise.create points:1, question:'<b>question</b>'
    exercise.should_not be_valid
    Exercise.count.should be 0
  end

  it 'should not save if the answer contains HTML' do
    exercise = Exercise.create points:1, question:'question', answer:'<b>answer</b>'
    exercise.should_not be_valid
    Exercise.count.should be 0
  end

  it 'should not save if the criteria contains HTML' do
    exercise = Exercise.create points:1, question:'question', criteria:'<b>answer</b>'
    exercise.should_not be_valid
    Exercise.count.should be 0
  end

  describe "it's to_html method" do
    exercise = Exercise.new

    it 'should work with classic BBCode' do
      exercise.to_html('[b]bold[/b]').should eq '<p><strong>bold</strong></p>'
    end

    it 'should work with LaTeX' do
      exercise.to_html('[latex]\LaTeX[/latex]').should eq "<p><img src=\"http://chart.apis.google.com/chart?cht=tx&chl=\\LaTeX\"/></p>"
    end

    it 'should not allow dangerous BBCode elements' do
      exercise.to_html('[img]danger[/img]').should eq '<p>[img]danger[/img]</p>'
      exercise.to_html('[url]danger[/url]').should eq '<p>[url]danger[/url]</p>'
      exercise.to_html('[url=danger]danger[/url]').should eq '<p>[url=danger]danger[/url]</p>'
    end
  end
end