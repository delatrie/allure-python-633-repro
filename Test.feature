Feature: Step arguments

  @cucumber
  Scenario Outline: Cucumber
    Given there are <A> cucumbers
    When I eat <B> cucumbers
    And I eat <C> cucumbers
    Then I should have <D> cucumbers

    Examples:
      | A | B | C | D |
      | 5 | 3 | 2 | 0 |
      | 5 | 2 | 2 | 2 |
      | 6 | 2 | 2 | 1 |
      | 7 | 2 | 1 | 4 |
