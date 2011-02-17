Feature: Manage albums
  In order to manage albums
  User
  wants to add albums and tracks to his artists

  Scenario Outline: Add a new album
    Given I am logged in as "mjohann@rails-experts.com" with password "123456"
    When I am on the new album page
    And I fill in "Title" with "<title>"
    And I select "<artist>" from "Artist"
    And I fill in "Subtitle" with "<subtitle>"
    And I fill in "Description" with "<description>"
    And I fill in "album[issue_date]" with "<issue_date>"
    And I press "Save"
    Then I should see "Album was successfully created."

  Examples:
    | title  | subtitle         | description | issue_date | artist            |
    | One    | The second album | Lorem ipsum | 2010-01-11 | Helge Schneider   |
    | Two    | The third album  | Lorem ipsum | 2011-05-08 | Helge Schneider   |
