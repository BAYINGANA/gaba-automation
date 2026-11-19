Feature: Product filtering

  Background:

    Given the customer is on the AskOmDch website

  @positive
  Scenario Outline: Customer filters products by category using the category dropdown
    When the customer clicks the "<Page>" link in the main menu
    When the customer clicks the category list in the "Browse By Categories" section
    When the customer selects "<Category>" in the dropdown
    Then the "<Category>" page is displayed with <Number_of_products> products: <Results>
    Then no other product is displayed

    Examples:
      | Category | Page | Number_of_products | Results |
      |          |      |                    |         |

  @positive
  Scenario Outline: Customer filters products by category using the category list and sees the same number of products as the category count
    When the customer clicks the category list
    When the customer selects "<Category>" in the category list
    Then the "<Category>" page is displayed with only the products that belong to "<Category>"
    Then the number of products displayed equals the count shown next to "<Category>" in the category list

    Examples:
      | Category |

  @positive
  Scenario Outline: Customer filters products by a minimum price using the min handle
    When the customer opens the "<Page>" page
    When the customer moves the min handle of the price slider to <MinPrice>
    When the customer clicks the "Filter" button
    Then the "<Page>" page is displayed with only the products priced at or above <MinPrice>: <ExpectedProducts>
    Then the price text shows "Price: <MinPrice> — $150"

    Examples:
      | Page | MinPrice | ExpectedProducts |

  @positive
  Scenario Outline: Customer filters products by a maximum price using the max handle
    When the customer opens the "<Page>" page
    When the customer moves the max handle of the price slider to <MaxPrice>
    When the customer clicks the "Filter" button
    Then the "<Page>" page is displayed with only the products priced at or below <MaxPrice>: <ExpectedProducts>
    Then the price text shows "Price: $10 — <MaxPrice>"

    Examples:
      | Page | MaxPrice | ExpectedProducts |

  @positive
  Scenario Outline: Customer filters products by a price range using both handles and the handles keep their positions
    When the customer opens the "<Page>" page
    When the customer moves the min handle of the price slider to <MinPrice>
    When the customer moves the max handle of the price slider to <MaxPrice>
    When the customer clicks the "Filter" button
    Then the "<Page>" page is displayed with only the products priced between <MinPrice> and <MaxPrice>, including the products priced exactly at <MinPrice> and <MaxPrice>: <ExpectedProducts>
    Then the price text shows "Price: <MinPrice> — <MaxPrice>"
    Then the min handle remains at <MinPrice>
    Then the max handle remains at <MaxPrice>

    Examples:
      | Page | MinPrice | MaxPrice | ExpectedProducts |
