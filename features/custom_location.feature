Feature: Custom location

  As a todoer
  I want to store my todo's in a location of my choosing
  So I can control where my todo's are stored

  Scenario: Store todo's in custom location
    Given there is a custom location
    When I add a task with the custom location
    Then there should be 1 task in the custom location

  Scenario: Many todo's in custom location
    When I add 4 tasks with the custom location
    Then there should be 4 tasks in the custom location
    And I should see 4 tasks when I list tasks from the custom location
