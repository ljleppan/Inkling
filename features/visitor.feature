#encoding: utf-8
@load-seed-data

Feature: I can examine the app without logging in
  In order to examine the app
  As a user
  I want to view courses

  Scenario: I can see a link to Courses from the front page
    Given I am on the front page
    And I can see a link with text 'Courses'
    When I click 'Courses'
    Then I should see 'Current courses'
    And I should see 'Inactive courses'

  Scenario: I can examine a single course
    Given I am viewing courses
    And I can see a link with text 'Ohjelmoinnin perusteet'
    When I click 'Ohjelmoinnin perusteet'
    Then I should see 'University course ID: 581325'
    Then I should see 'This course is currently active'
    Then I should see 'Exams'
    Then I should see 'Exercises'

  Scenario: I can not edit courses
    Given I am viewing courses/1/edit
    Then I should be prompted for login

  Scenario: I can not view exams
    Given I am viewing exams
    Then I should be prompted for login

  Scenario: I can not view a single exam
    Given I am viewing exams/1
    Then I should be prompted for login

  Scenario: I can not edit exams
    Given I am viewing exams/1/edit
    Then I should be prompted for login

  Scenario: I can not view exercises
    Given I am viewing exercises
    Then I should be prompted for login

  Scenario: I can not view a single exercise
    Given I am viewing exercises/1
    Then I should be prompted for login

  Scenario: I can not edit exercise
    Given I am viewing exercises/1/edit
    Then I should be prompted for login
    
  Scenario: I can see register
    Given I am on the front page
    When I click 'Register'
    And I input 'asd123' to 'user_username'
    And I input 'asd123' to 'user_password'
    And I input 'asd123' to 'user_password_confirmation'
    And I click 'Create User'
    Then I should see 'User was successfully created.'

  Scenario: I can not register with invalid inputs
    Given I am on the front page
    When I click 'Register'
    And I input '' to 'user_username'
    And I input '' to 'user_password'
    And I input '1' to 'user_password_confirmation'
    And I click 'Create User'
    Then I should see 'Username is too short (minimum is 3 characters)'
    And I should see 'Password is too short (minimum is 4 characters)'
    And I should see 'Password can't be blank'

  Scenario: I can login as the created user
    Given I am on the front page
    When I click 'Register'
    And I input 'asd123' to 'user_username'
    And I input 'asd123' to 'user_password'
    And I input 'asd123' to 'user_password_confirmation'
    And I click 'Create User'
    And I input 'asd123' to 'username'
    And I input 'asd123' to 'password'
    And I click 'Log in'
    Then I should see 'Welcome back!'

  Scenario: I can not login with improper credentials:
    Given I am viewing login
    And I input 'lol' to 'username'
    And I input 'lol' to 'password'
    And I click 'Log in'
    Then I should see 'username and password do not match'