Feature: Manage users
  In order to work with artothek
  User
  wants to be registered to login
  
  Scenario Outline: Anonymous user can register
    Given I am on the homepage
    When I go to the sign up page
    Then I should see "Sign up"
    And I fill in "Email" with "<email>"
    And I fill in "Password" with "<password>"
    And I fill in "Password confirmation" with "<password>"
    And I press "Sign up"
    Then I should be on the homepage
    Then I should see "Welcome to artothek"

      Examples:
        | email                     | password |
        | mjohann@rails-experts.com | 123456   |
        | helge@schneider.com       | 123456   |
        | steve@apple.com           | 123456   |

  Scenario: Anonymous user can login
    Given I am on the homepage
    And I am registered as "mjohann@web.de" with password "123456"
    When I go to the sign in page
    Then I should see "Sign in"
    And I fill in "Email" with "mjohann@web.de"
    And I fill in "Password" with "123456"
    And I press "Sign in"
    Then I should be on the homepage
    Then I should see "Welcome to artothek"
    Then I should see "You are logged in as mjohann@web.de. Logout."

  Scenario: Login user without credentials
    Given I am on the homepage
    And I am registered as "mjohann@web.de" with password "123456"
    When I go to the sign in page
    Then I should see "Sign in"
    And I press "Sign in"
    Then I should be on the sign in page
    Then I should see "Sign in"
    Then I should not see "You are logged in as mjohann@web.de. Logout."

  Scenario: Logout authenticated user
    Given I am on the homepage
    And I am logged in as "mjohann@web.de" with password "123456"
    And I should see "You are logged in as mjohann@web.de. Logout."
    When I go to the sign out page
    Then I should be on the homepage
    Then I should see "Welcome to artothek"

