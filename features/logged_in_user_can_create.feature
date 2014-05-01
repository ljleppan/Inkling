#encoding: utf-8
@load-seed-data @create-normal-user

Feature: I can create everything as a logged in user
  In order to keep the app up to date
  As a user
  I want to create courses, exams and exercises
  
  Scenario: I can create courses
    Given I am a logged in user
    And I am viewing courses
    When I click 'New Course'
    And I input 'Testi' to 'course_name'
    And I input '1000' to 'course_hy_id'
    And I click 'Create Course'
    Then I should see 'Course was successfully created.'
    And I should see 'University course ID: 1000'
    And I should see 'Testi'
    And I should see 'No known exams.'

  Scenario: I can create exams
    Given I am a logged in user
    And I am viewing exams
    When I click 'New Exam'
    And I select 'Tietorakenteet ja algoritmit' as 'exam_course_id'
    And I select '2013' as 'exam_date_1i'
    And I select 'February' as 'exam_date_2i'
    And I select '15' as 'exam_date_3i'
    And I select 'Erilliskoe' as 'exam_exam_type_id'
    And I click 'Create Exam'
    Then I should see 'Exam was successfully created.'
    And I should see 'Tietorakenteet ja algoritmit'
    And I should see 'Erilliskoe 2013-02-15'
    And I should see 'No known exercises.'

  Scenario: I can create exams
    Given I am a logged in user
    And I am viewing exercises
    When I click 'New Exercise'
    And I input '15' to 'exercise_points'
    And I input 'kysymys_teksti' to 'exercise_question'
    And I input 'vastaus_teksti' to 'exercise_answer'
    And I input 'arvostelu_teksti' to 'exercise_criteria'
    And I click 'Create Exercise'
    Then I should see 'Exercise was successfully created.'
    And I should see 'Points: 15'
    And I should see 'kysymys_teksti'
    And I should see 'vastaus_teksti'
    And I should see 'arvostelu_teksti'
    And I should see 'No known occurances.'

  Scenario: I can add exercises to exams
    Given I am a logged in user
    And I am viewing exercises/1
    And I select 'Ohjelmoinnin jatkokurssi' as 'courses_select'
    And I select '2012-05-04' as 'exams_select'
    And I click 'Save changes'
    Then I should see 'Exercise was successfully added to the exam'
    And I should see 'Ohjelmoinnin jatkokurssi - Kurssikoe - 2012-05-04'

  Scenario: I can add not add exercises to exams again
    Given I am a logged in user
    And I am viewing exercises/1
    And I select 'Ohjelmoinnin perusteet' as 'courses_select'
    And I select '2012-02-28' as 'exams_select'
    And I click 'Save changes'
    Then I should see 'Unable to add the exercise to the exam, this is most likely because exercise is already part of the exam.'