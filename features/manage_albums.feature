Feature: Manage albums
  In order to manage albums
  User
  wants to add albums and tracks to his artists
@wip
  Scenario Outline: Add a new album
    Given I am logged in as "mjohann@rails-experts.com" with password "123456"
    When I am on the new album page
    And I fill in "Title" with "<title>"
    And I select "<artist>" from "Artist"
    And I fill in "Subtitle" with "<subtitle>"
    And I fill in "Description" with "<description>"
    And I select "<issue_date>" as the "album_issue_date" date
    And I press "Save"
    Then I should see "Album was successfully created."

  Examples:
    | title  | subtitle         | description | issue_date      | artist            |
    | One    | The second album | Lorem ipsum | 11 January 2010 | Helge Schneider   |
