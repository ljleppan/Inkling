#encoding: utf-8
@load-seed-data @create-normal-user

Feature: I can see everything as a logged in user
  In order to prepare for a test
  As a user
  I want to view courses, exams and exercises
  
  Scenario: I can enter login page
    Given I am on the front page
    And I can see a link with text 'Login'
    And I click 'Login'
    Then I should be prompted for login

  Scenario: I can login
    Given I am viewing login
    And I input 'test_user' to 'username'
    And I input 'test_user' to 'password'
    And I click 'Log in'
    Then I should see 'Welcome back!'

  Scenario: I can logout
    Given I am a logged in user
    And I am on the front page
    When I click 'Logout'
    Then I should see 'Register'
    Then I should see 'Login'


  Scenario: I can see a link to Courses from the front page
    Given I am a logged in user
    And I am on the front page
    And I can see a link with text 'Courses'
    When I click 'Courses'
    Then I should see 'Current courses'
    And I should see 'Inactive courses'

  Scenario: I can examine a single course
    Given I am a logged in user
    And I am viewing courses
    And I can see a link with text 'Ohjelmoinnin perusteet'
    When I click 'Ohjelmoinnin perusteet'
    Then I should see 'University course ID: 581325'
    Then I should see 'This course is currently active'
    Then I should see 'Exams'
    Then I should see 'Exercises'

  Scenario: I can view exams
    Given I am a logged in user
    And I am viewing exams
    Then I should see 'Ohjelmoinnin perusteet'
    And I should see '2014-02-25'

  Scenario: I can view a single exam
    Given I am a logged in user
    And I am viewing exams
    When I click '2014-02-25'
    Then I should see 'Ohjelmoinnin perusteet'
    And I should see 'Kurssikoe 2014-02-25'
    And I should see 'Question'
    And I should see 'Tehtävän vastauksen pituuden ei tule ylittää kahta sivua.'
    And I should see 'Pistemääriä -4 ja 100 ei siis huomioida tuloksissa.'

  Scenario: I can view a single exercise from an exam page
    Given I am a logged in user
    And I am viewing exams/5
    And I click '#1'
    Then I should see 'Exercise #1'
    And I should see 'Exercise info'
    And I should see 'Found in following exams'

  Scenario: I can view exercises
    Given I am a logged in user
    And I am viewing exercises
    Then I should see 'Usages'
    And I should see 'Points'
    And I should see 'Question'
    And I should see 'Kerro mitä seuraavat ...'

  Scenario: I can view a single exercise from the exercises page
    Given I am a logged in user
    And I am viewing exercises
    And I click 'Kerro mitä seuraavat ...'
    Then I should see 'Exercise #1'
    And I should see 'Exercise info'
    And I should see 'Found in following exams'