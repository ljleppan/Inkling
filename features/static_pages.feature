#encoding: utf-8
@load-seed-data

Feature: I can see static info-pages
  In order to learn more about the app
  As a user
  I want to see the info pages

  Scenario: I can see the link to the About page
    Given I am on the front page
    Then I can see a link with text 'About'

  Scenario: I can see the link to the Contact page
    Given I am on the front page
    Then I can see a link with text 'Contact'

  Scenario: I can open the About page
    Given I am on the front page
    And I click 'About'
    Then I should see 'Welcome to Inkling, a Ruby on Rails project for the University of Helsinki lab Web-application Development, Ruby on Rails.'

  Scenario: I can open the Contact page
    Given I am on the front page
    And I click 'Contact'
    Then I should see 'You can reach the author by creating an issue on GitHub, or by contacting Loezi on IRCnet.'