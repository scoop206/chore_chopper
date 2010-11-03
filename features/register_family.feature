Feature: Register Family

  So that families can register and manage their profile
  As a family
  I want to be able to register and manage my profile
  
  Scenario: A Family wants to Register for the first time
    Given A family wants to register
    When They click on the register button
    Then they get a registration form
    
  Scenario: A Family submits the registration form
    Given A family is at the registration form page
    When They fillout and submit the registration form
    Then A new family is created for them
    And they are sent to the login page

    