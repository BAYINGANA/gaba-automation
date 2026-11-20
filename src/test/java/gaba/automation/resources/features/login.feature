Feature: Login

  Background:
    Given the customer is on the Login page

  @negative
  Scenario Outline: System prevents a customer from logging in with invalid credentials
    When the customer enters the username or email address "<usernameOrEmailData>"
    When the customer enters the password "<passwordData>"
    When the customer clicks the "LOG IN" button
    Then the system displays the error message "<errorMessage>"

    Examples:
      | usernameOrEmailData | passwordData      | errorMessage                  |
      | unknownuser         | ValidPassword123! | Invalid username or password. |
      |                     |                   | Username is required.         |
      |                     | AnyPassword123!   | Username is required.         |
      | customer            | IncorrectPass456! | Invalid username or password. |
      | unknownmember       |                   | The password field is empty.  |



  @negative
  Scenario Outline: System prevents a customer from logging in with non-existing account
    Given the customer does not have an existing account
    When the customer enters the username or email address "<usernameOrEmailData>"
    When the customer enters the password "<passwordData>"
    When the customer clicks the "LOG IN" button
    Then the system displays the error message "<errorMessage>"

    Examples:
      | usernameOrEmailData | passwordData        | errorMessage                                                                                                               |
      | george123           | InvalidPassword123! | The username george123 is not registered on this site. If you are unsure of your username, try your email address instead. |
      | Mike123             | InvalidPassword123! | The username Mike123 is not registered on this site. If you are unsure of your username, try your email address instead.   |

  @positive
  Scenario: Customer logs in with valid credentials
    Given the customer has an existing account
    When the customer enters the username or email address "<usernameOrEmailData>"
    When the customer enters the password "<passwordData>"
    When the customer clicks the "LOG IN" button
    Then the system redirects the customer to their account dashboard
    And the system displays the message "<successMessage>"
        Examples:
      | usernameOrEmailData | passwordData        | successMessage                                                                                                               |
      | Test250         | 1234567890|Hello Test250 (not Tester250? Log out) |
      | tester250@gmail.com | 1234567890 | Hello Georges241 (not Georges241? Log out)  |