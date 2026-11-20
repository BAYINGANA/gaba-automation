Feature: View Products

    Background:
        Given the system have products
        Given the system is accessible

    @positive
    Scenario: Customer views products on Store page
        When the Customer clicks the "Store" Link in the navbar
        Then the Customer is succesfully directed to the "Store page" the available products are being displayed in grid format with product image,product name,product price and add to cart button


    @positive
    Scenario: Customer views products on Home page
        When the Customer clicks the "Home" Link in the navbar
        Then the Customer is succesfully directed to the "Home page" the available products are being displayed in grid format with product image,product name,product price and add to cart button


    @positive
    Scenario Outline: Customer views products on Category pages
        When the Customer clicks the "<category_link>" Link in the navbar
        Then the Customer is succesfully directed to the "<category_link> page" the available products are being displayed in grid format with product image,product name,product price and add to cart button
        Examples:
            | category_link |
            | men           |
            | women         |
            | accesories    |
            | womens-jeans  |
            | womens-shirt  |
            | womens-shoes  |
            | mens-shirt    |
            | men-shoes     |
            | men-jeans     |


    Scenario Outline: Customer views product details on product details page
        Given the Customer is on the "Home page" or "Store page" or "Product categories pages"
        When the Customer on the "<click_target>" of the "<product>" card
        Then the Customer is directed to selected "<product>" details page where he is seeing the product name,price,the short description under the price, and the category line categories,product additional information and review tabs and also the system should show the related products.

        Examples:
            | click_target  | product          |
            | product-image | anchor bracelete |
            | product-name  | blue tshirt      |
            | product-image | Denim Blue Jeans |
            | product-name  | green tshirt     |

    Scenario Outline: Customer views product price
        Given the Customer is on the "Home page" or "Store page" or "Product categories pages"
        When the Customer checks "<product>" card and views "<product_price>" on the product card
        Then the Customer views the "<expected_display>" on the "<product>" card.

        Examples:
            | product                         | expected_display            |
            | Anchor Bracelet                 | Sale! badge, $12.00, $10.00 |
            | Basic Blue Jeans                | Sale! badge, $34.00, $30.00 |
            | Blue Denim Shorts               | Sale! badge, $45.00, $35.00 |
            | Black Over-the-shoulder Handbag | $75.00 only, no badge       |
            | Blue Shoes                      | $45.00 only, no badge       |
            | Boho Bangle Bracelet            | $25.00 only, no badge       |







