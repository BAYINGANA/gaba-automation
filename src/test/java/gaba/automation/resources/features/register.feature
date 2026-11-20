Feature: Register

  Background:
    Given the customer is on the Register page

  @positive
  Scenario Outline: Customer registers with valid credentials
    When the customer enters username "<username>"
    And the customer enters email "<email>"
    And the customer enters password "<passwordData>"
    And the customer clicks on the "REGISTER" button
    Then the system creates a new account for the customer
    And the system redirects the customer to the "Dashboard" page
    And the system displays the message "<successMessage>"

    Examples:
      | username     | email                    | passwordData | successMessage                                 |
      | Test250      | test250@gmail.com        | 1234567890   | Hello Test250 (not Test250? Log out)           |
      | Tester250    | tester250@gmail.com      | 1234567890   | Hello Tester250 (not Tester250? Log out)       |
      | Georges241   | georges.tester@gmail.com | TesterJR@QA  | Hello Georges241 (not Georges241? Log out)     |
      | Georges241_b | georges241@gmail.com     | Pass@2026!   | Hello Georges241_b (not Georges241_b? Log out) |
      | customer_kgl | customer.kgl@gmail.com   | Secure#789   | Hello customer_kgl (not customer_kgl? Log out) |

  @negative
  Scenario Outline: System prevents registration with existing credentials
    When the customer enters username "<username>"
    And the customer enters email "<email>"
    And the customer enters password "<passwordData>"
    And the customer clicks on the "REGISTER" button
    Then the system displays the message "<errorMessage>"
    And the system does not create a new account for the customer
    And the system keeps the customer on the "Register" page

    Examples:
      | username     | email                    | passwordData | errorMessage                                                             |
      | Test250      | test250@gmail.com        | 1234567890   | An account is already registered with your email address. Please log in. |
      | Tester250    | tester250@gmail.com      | 1234567890   | An account is already registered with your email address. Please log in. |
      | Georges241   | georges.tester@gmail.com | TesterJR@QA  | An account is already registered with your email address. Please log in. |
      | Georges241_b | georges241@gmail.com     | Pass@2026!   | An account is already registered with your email address. Please log in. |
      | customer_kgl | customer.kgl@gmail.com   | Secure#789   | An account is already registered with your email address. Please log in. |

  @negative
  Scenario Outline: System prevents registration with missing or invalid fields
    When the customer enters username "<username>"
    And the customer enters email "<email>"
    And the customer enters password "<passwordData>"
    And the customer clicks on the "REGISTER" button
    Then the system displays the message "<errorMessage>"
    And the system does not create a new account for the customer
    And the system keeps the customer on the "Register" page

    Examples:
      | username   | email            | passwordData | errorMessage                                                               |
      |            | tester@gmail.com | tester123    | Please enter a valid account username.                                     |
      | Georges241 |                  | tester123    | Please enter a valid email address.                                        |
      | Georges241 | tester@gmail.com |              | Please enter a valid password.                                             |
      | Georges241 | test             | tester123    | Please include "@" in your email address "test" is missing the "@" symbol. |