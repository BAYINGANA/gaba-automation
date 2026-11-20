Feature: Payment Method

        @Background:
        Given The Customer is on the "Checkout-Page"


        @positive
        @Scenario Outline: Payment Methods displayed on Checkout Page
        When The Customer navigates to payment section
        When The Customer checks the available payment methods
        Then The System should display the two "<payment_methods>" to the Customer

            @Examples:
            | payment_methods      |
            | Direct bank transfer |
            | Cash on Delivery     |

        @positive
        @Scenario Outline: Only one Payment Method can be selected
        When The Customer selects the "<first_method>"
        When The Customer selects the "<second_method>"
        Then The Customer should see the selected method "<first_method>" and "<second_method>" is deselected only one method will be selected at once.

        Examples:
            | first_method         | second_method    |
            | Direct bank transfer | Cash on Delivery |

        @positive
        @Scenario Outline: Order summary stays visible when the Payment Method changes
        Given The Customer billing details form is filled
        When The Customer checks the Order summary
        When The Customer selects the payment Method
        Then The Customer see the selected "<payment_method>" and with the Product:"<product>" Quantity:"<quantity>" Product Price:"<product_price>" SubTotal:"<subtotal>" Shipping Cost:"<shipping_cost>" Shipping Method:"<shipping_method>" Tax Label:"<tax_label>" Tax:"<tax>" Total:"<total>"

            @Examples:
            | payment_method       | quantity | product     | product_price | subtotal | shipping_cost | shipping_method | tax_label    | tax   | total  |
            | Cash on Delivery     | 1        | Blue Tshirt | $45.00        | $45.00   | $5.00         | Flat rate       | Al State Tax | $1.80 | $51.80 |
            | Direct bank transfer | 1        | Blue Tshirt | $45.00        | $45.00   | $5.00         | Flat rate       | Al State Tax | $1.80 | $51.80 |
            | Cash on Delivery     | 1        | Blue Tshirt | $45.00        | $45.00   | $5.00         | Flat rate       | Al State Tax | $1.80 | $51.80 |
            | Direct bank transfer | 1        | Blue Tshirt | $45.00        | $45.00   | $5.00         | Flat rate       | Al State Tax | $1.80 | $51.80 |
            | Cash on Delivery     | 1        | Blue Tshirt | $45.00        | $45.00   | $5.00         | Flat rate       | Al State Tax | $1.80 | $51.80 |
            | Direct bank transfer | 1        | Blue Tshirt | $45.00        | $45.00   | $5.00         | Flat rate       | Al State Tax | $1.80 | $51.80 |
            | Cash on Delivery     | 1        | Blue Tshirt | $45.00        | $45.00   | $5.00         | Flat rate       | Al State Tax | $1.80 | $51.80 |
            | Direct bank transfer | 1        | Blue Tshirt | $45.00        | $45.00   | $5.00         | Flat rate       | Al State Tax | $1.80 | $51.80 |





