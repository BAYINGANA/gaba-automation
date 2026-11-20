Feature: Returning customer checkout

  Background:
    Given the customer is on the Checkout page with products in the cart

  @positive
  Scenario Outline: Customer logs in during checkout with a registered username or email in any letter case and stays on the Checkout page
    When the customer enters <LoginName> in the "Username or email" field
    When the customer enters <Password> in the "Password" field
    When the customer clicks the "Login" button
    Then the customer is logged in
    Then the Checkout page is still displayed

    Examples:
      | LoginName             | Password        |
      | gabasaved             | Gaba@2026!Saved |
      | gabasaved@example.com | Gaba@2026!Saved |
      | GABASAVED             | Gaba@2026!Saved |
      | GabaSaved             | Gaba@2026!Saved |
      | GABASAVED@EXAMPLE.COM | Gaba@2026!Saved |

  @positive
  Scenario Outline: Customer sees the saved billing details prefilled after logging in with an account that has them
    When the customer enters <LoginName> in the "Username or email" field
    When the customer enters <Password> in the "Password" field
    When the customer clicks the "Login" button
    Then the customer is logged in
    Then the billing fields contain <ExpectedBillingDetails>

    Examples:
      | LoginName              | Password           | ExpectedBillingDetails                                                                                                                                                                                                                                                                                            |
      | gabasaved              | Gaba@2026!Saved    | First name: Divine; Last name: Bayingana; Company name: GABA Testing; Country / Region: United States (US); Street address: 123 Main Street; Apartment, suite, unit, etc.: Apt 4B; Town / City: New York; State: New York; ZIP Code: 10001; Phone: 2125550123; Email address: gabasaved@example.com               |
      | gabareturn@example.com | Gaba@2026!Return   | First name: Aline; Last name: Uwase; Company name: Kigali Retail Ltd; Country / Region: United States (US); Street address: 456 Sunset Boulevard; Apartment, suite, unit, etc.: Suite 210; Town / City: Los Angeles; State: California; ZIP Code: 90001; Phone: 3235550147; Email address: gabareturn@example.com |
      | GABAORDER              | Gaba@2026!Order    | First name: Eric; Last name: Mugisha; Company name: Lakeview Supplies; Country / Region: United States (US); Street address: 789 Lake Shore Drive; Apartment, suite, unit, etc.: Unit 12; Town / City: Chicago; State: Illinois; ZIP Code: 60601; Phone: 3125550182; Email address: gabaorder@example.com         |
      | GabaCheckout           | Gaba@2026!Checkout | First name: Grace; Last name: Ineza; Company name: Bayou Traders; Country / Region: United States (US); Street address: 321 Bayou Street; Apartment, suite, unit, etc.: Floor 3; Town / City: Houston; State: Texas; ZIP Code: 77001; Phone: 7135550116; Email address: gabacheckout@example.com                  |
      | GABAMEMBER@EXAMPLE.COM | Gaba@2026!Member   | First name: Patrick; Last name: Niyonzima; Company name: Ocean Goods Inc; Country / Region: United States (US); Street address: 654 Ocean Avenue; Apartment, suite, unit, etc.: Apt 9C; Town / City: Miami; State: Florida; ZIP Code: 33101; Phone: 3055550169; Email address: gabamember@example.com             |


  @positive
  Scenario Outline: Customer places an order and sees the order received message
    When the customer selects <PaymentMethod> as the payment method
    When the customer clicks the "Place order" button
    Then the order received page is displayed with the message "Thank you. Your order has been received."

    Examples:
      | PaymentMethod        |
      | Direct bank transfer |
      | Check payments       |
      | Cash on delivery     |
