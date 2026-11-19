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
      | Category    | Page        | Number_of_products | Results                                                                                                                                |
      | Store       | Men         | 7                  | Basic Blue Jeans, Blue Shoes, Dark Brown Jeans, Dark Grey Jeans, Faint Blue Jeans, Green Tshirt, Red Shoes                             |
      | Store       | Women       | 7                  | Anchor Bracelet, Black Over-the-shoulder Handbag, Blue Denim Shorts, Blue Tshirt, Boho Bangle Bracelet, Denim Blue Jeans, Green Tshirt |
      | Store       | Accessories | 3                  | Anchor Bracelet, Black Over-the-shoulder Handbag, Boho Bangle Bracelet                                                                 |
      | Men         | Women       | 7                  | Anchor Bracelet, Black Over-the-shoulder Handbag, Blue Denim Shorts, Blue Tshirt, Boho Bangle Bracelet, Denim Blue Jeans, Green Tshirt |
      | Men         | Accessories | 3                  | Anchor Bracelet, Black Over-the-shoulder Handbag, Boho Bangle Bracelet                                                                 |
      | Women       | Men         | 7                  | Basic Blue Jeans, Blue Shoes, Dark Brown Jeans, Dark Grey Jeans, Faint Blue Jeans, Green Tshirt, Red Shoes                             |
      | Women       | Accessories | 3                  | Anchor Bracelet, Black Over-the-shoulder Handbag, Boho Bangle Bracelet                                                                 |
      | Accessories | Men         | 7                  | Basic Blue Jeans, Blue Shoes, Dark Brown Jeans, Dark Grey Jeans, Faint Blue Jeans, Green Tshirt, Red Shoes                             |
      | Accessories | Women       | 7                  | Anchor Bracelet, Black Over-the-shoulder Handbag, Blue Denim Shorts, Blue Tshirt, Boho Bangle Bracelet, Denim Blue Jeans, Green Tshirt |

  @positive
  Scenario Outline: Customer filters products by category using the category list and sees the same number of products as the category count
    When the customer clicks the category list
    When the customer selects "<Category>" in the category list
    Then the "<Category>" page is displayed with only the products that belong to "<Category>"
    Then the number of products displayed equals the count shown next to "<Category>" in the category list

    Examples:
      | Category       |
      | Men            |
      | Women          |
      | Accessories    |
      | Men's Jeans    |
      | Men's Shirts   |
      | Men's Shoes    |
      | Women's Jeans  |
      | Women's Shirts |
      | Women's Shoes  |

  @positive
  Scenario Outline: Customer filters products by a minimum price using the min handle
    When the customer opens the "<Page>" page
    When the customer moves the min handle of the price slider to <MinPrice>
    When the customer clicks the "Filter" button
    Then the "<Page>" page is displayed with only the products priced at or above <MinPrice>: <ExpectedProducts>
    Then the price text shows "Price: <MinPrice> — $150"

    Examples:
      | Page        | MinPrice | ExpectedProducts                                                                                       |
      | Store       | $50      | Black Over-the-shoulder Handbag, Faint Blue Jeans, Dark Grey Jeans, Denim Blue Jeans, Dark Brown Jeans |
      | Store       | $100     | Dark Grey Jeans, Denim Blue Jeans, Dark Brown Jeans                                                    |
      | Store       | $145     | Dark Brown Jeans                                                                                       |
      | Men         | $50      | every Men product priced at or above $50 and no other product                                          |
      | Women       | $50      | every Women product priced at or above $50 and no other product                                        |
      | Accessories | $50      | every Accessories product priced at or above $50 and no other product                                  |

  @positive
  Scenario Outline: Customer filters products by a maximum price using the max handle
    When the customer opens the "<Page>" page
    When the customer moves the max handle of the price slider to <MaxPrice>
    When the customer clicks the "Filter" button
    Then the "<Page>" page is displayed with only the products priced at or below <MaxPrice>: <ExpectedProducts>
    Then the price text shows "Price: $10 — <MaxPrice>"

    Examples:
      | Page        | MaxPrice | ExpectedProducts                                                                                                 |
      | Store       | $20      | Anchor Bracelet, Green Tshirt                                                                                    |
      | Store       | $35      | Anchor Bracelet, Green Tshirt, Boho Bangle Bracelet, Basic Blue Jeans, Red Shoes, Blue Tshirt, Blue Denim Shorts |
      | Men         | $35      | every Men product priced at or below $35 and no other product                                                    |
      | Women       | $35      | every Women product priced at or below $35 and no other product                                                  |
      | Accessories | $35      | every Accessories product priced at or below $35 and no other product                                            |

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
      | Page           | MinPrice | MaxPrice | ExpectedProducts                                                                                |
      | Store          | $30      | $45      | Basic Blue Jeans, Red Shoes, Blue Tshirt, Blue Denim Shorts, Blue Shoes                         |
      | Store          | $20      | $35      | Green Tshirt, Boho Bangle Bracelet, Basic Blue Jeans, Red Shoes, Blue Tshirt, Blue Denim Shorts |
      | Store          | $86      | $100     | Faint Blue Jeans, Dark Grey Jeans, Denim Blue Jeans                                             |
      | Men            | $30      | $100     | every Men product priced between $30 and $100 and no other product                              |
      | Women          | $30      | $100     | every Women product priced between $30 and $100 and no other product                            |
      | Accessories    | $30      | $100     | every Accessories product priced between $30 and $100 and no other product                      |
      | Men's Jeans    | $30      | $100     | every Men's Jeans product priced between $30 and $100 and no other product                      |
      | Men's Shirts   | $30      | $100     | every Men's Shirts product priced between $30 and $100 and no other product                     |
      | Men's Shoes    | $30      | $100     | every Men's Shoes product priced between $30 and $100 and no other product                      |
      | Women's Jeans  | $30      | $100     | every Women's Jeans product priced between $30 and $100 and no other product                    |
      | Women's Shirts | $30      | $100     | every Women's Shirts product priced between $30 and $100 and no other product                   |
      | Women's Shoes  | $30      | $100     | every Women's Shoes product priced between $30 and $100 and no other product                    |
