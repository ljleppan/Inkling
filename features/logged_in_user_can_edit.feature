#encoding: utf-8
@load-seed-data @create-normal-user

Feature: I can edit everything as a logged in user
  In order to keep the app up to date
  As a user
  I want to edit courses, exams and exercises

  Scenario: I can edit courses
    Given I am a logged in user
    And I am viewing courses/1
    When I click 'Edit'
    And I input 'Muutos!' to 'course_name'
    And I click 'Update Course'
    Then I should see 'Course was successfully updated.'
    And I should see 'Muutos!'

  Scenario: Editing courses fails on invalid inputs
    Given I am a logged in user
    And I am viewing courses/1/edit
    And I input '' to 'course_name'
    And I input '' to 'course_hy_id'
    And I click 'Update Course'
    Then I should see 'Name is too short (minimum is 3 characters)'
    And I should see 'Hy is not a number'

  Scenario: I can edit exams
    Given I am a logged in user
    And I am viewing exams/1
    When I click 'Edit'
    And I select 'January' as 'exam_date_2i'
    And I click 'Update Exam'
    Then I should see 'Exam was successfully updated.'
    And I should see '2012-01-28'

  Scenario: I can edit exercises
    Given I am a logged in user
    And I am viewing exercises/1
    When I click 'Edit'
    And I input 'Muutos!' to 'exercise_answer'
    And I click 'Update Exercise'
    Then I should see 'Exercise was successfully updated.'
    And I should see 'Muutos!'

  Scenario: Editing exercise fails with invalid inputs
    Given I am a logged in user
    And I am viewing exercises/1/edit
    And I input '' to 'exercise_question'
    And I input '' to 'exercise_points'
    And I click 'Update Exercise'
    Then I should see 'Points is not a number'
    And I should see 'Question can't be blank'
    
  @javascript
  Scenario: I can add an exercise to an exam
    Given I am a logged in user
    And I am viewing exercises/1
    And I select 'Ohjelmistotekniikan menetelmät' as 'courses_select'
    And I select '2013-12-11' as 'exams_select'
    And I click 'Save changes'
    Then I should see 'Exercise was successfully added to the exam'
    And I should see 'Ohjelmistotekniikan menetelmät - Kurssikoe - 2013-12-11'

