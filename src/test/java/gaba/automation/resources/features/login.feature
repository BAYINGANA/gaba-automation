Feature: Login

  Background:
    Given the customer is on the Login page

  @positive
  Scenario Outline: Customer logs in with valid credentials
    Given the customer has an existing account
    When the customer enters the username or email address "<usernameOrEmailData>"
    And the customer enters the password "<passwordData>"
    And the customer clicks the "LOG IN" button
    Then the system redirects the customer to their account dashboard
    And the system displays the message "<successMessage>"

    Examples:
      | usernameOrEmailData | passwordData | successMessage                         |
      | Test250             | 1234567890   | Hello Test250 (not Test250? Log out)   |
      | tester250@gmail.com | 1234567890   | Hello Tester250 (not Tester250? Log out) |

  @negative
  Scenario Outline: System prevents a customer from logging in with invalid credentials
    When the customer enters the username or email address "<usernameOrEmailData>"
    And the customer enters the password "<passwordData>"
    And the customer clicks the "LOG IN" button
    Then the system displays the error message "<errorMessage>"
    And the system does not authenticate the customer
    And the system keeps the customer on the "Login" page

    Examples:
      | usernameOrEmailData | passwordData        | errorMessage                                                                                                               |
      | unknownuser         | ValidPassword123!   | Invalid username or password.                                                                                              |
      |                     |                   | Username is required.                                                                                                      |
      |                     | AnyPassword123!   | Username is required.                                                                                                      |
      | customer            | IncorrectPass456!   | Invalid username or password.                                                                                              |
      | unknownmember       |                     | The password field is empty.                                                                                               |
      | george123           | InvalidPassword123! | The username george123 is not registered on this site. If you are unsure of your username, try your email address instead. |
      | Mike123             | InvalidPassword123! | The username Mike123 is not registered on this site. If you are unsure of your username, try your email address instead.   |

