Feature: Test plan sample
#1
  Scenario: Main page functionality - header navigation

    Then Check that menu item "Dog" contains submenus

    Then Check that menu item "Cat" contains submenus

    Then Check that menu item "Fish" contains submenus

    Then Check that menu item "Sale" contains submenus

#2
  Scenario: Main page functionality - footer navigation
    Then Check footer menu "Store Services" with items
    Then Check footer menu "PetSmart Cares" with items
    Then Check footer menu "Shop With Us" with items
    Then Check footer menu "Education" with items
    Then Check footer menu "About PetSmart" with items
#3
  Scenario: Main page functionality - external links - facebook
    Then Click on "Facebook" icon
    Then Verify navigation to "PetSmart"
#4
  Scenario: Main page functionality - external links - hangouts
    Then Click on "Google Plus" icon
    Then Verify navigation to "PetSmart - Google+"
#5
  Scenario: Main page functionality - external links - twitter
    Then Click on "Twitter" icon
    Then Verify navigation to "PetSmart (@PetSmart) | Twitter"

#6
  Scenario: Main page fuctionality - external links- instagram
    Then Click on "Instagram" icon
    Then Verify user navigate to "Instagram"
#7
  Scenario: Main page functionality - external links - pinterest
    Then Click on "Pinterest" icon
    Then Verify navigation to "PetSmart on Pinterest"
#8
  Scenario: Main page functionality - external links - youtube
    Then Click on "YouTube" icon
    Then Verify user navigate to "YouTube"
#9
  Scenario: Main page functionality - upcoming events wrapper
    Then Print out all upcoming events in wrapper
 #10
  Scenario: Dog - Food - sorting - price low to high
    Then In dog menu go to food
    #Then Set sorting to "Low to high"
    Then Set sorting to "Low to high" and verify correct sorting
#11
  Scenario: Main page functionality - search - valid search
    Then In search type Food
    Then Check that some results returned Food
#12
  Scenario: Main page functionality - search - invalid search
    Then In search type Tanya
    Then Check that no results "Tanya" returned and message "0 Results for:"
#13
  Scenario: Main page functionality - pet services wrapper
    Then in Pet service click on each item and verify that all promo messages are different
#14
  Scenario: Dog - Food and health - Brands
    Then In "Dog" menu go to "Food & health"
    Then In "Featured Brands" check that each brand navigates to the page with brand specific items
#15
#  Scenario: Dog - Food and health - top categories
#    Then In "Dog" menu go to "Food & health"
#    Then Check that each link in "Top Categories" works
#16
  Scenario: Dog - Food - see 200 items verification
    Then In "Dog" menu go to "Food"
    Then Click "View 200 Items"
    Then Check that 200 items displayed
#17
  Scenario: Dog - Food - pagination verification
    Then In "Dog" menu go to "Food"
    Then Go through all pages and print out all given items
#18
  Scenario: Dog - Food - sorting - price high to low
    Then In "Dog" menu go to "Food"
    Then Set sorting to "High to low" and verify correct sorting
#19
  Scenario: Dog - Food - sorting - top rated
    Then In "Dog" menu go to "Food"
    Then Set sorting to "top rated" and verify correct  sorting

  Scenario: Rated
    Then In "Dog" menu go to "Food"
    Then Rates
# 20
#  Scenario: Dog - Food - sorting - best sellers
#    Then In "Dog" menu go to "Food"
#    Then Set sorting to "best sellers"
#    Then Verify correct sorting
# 21
#  Scenario: Dog - Food - sorting - new arrivals
#    Then In "Dog" menu go to "Food"
#    Then Set sorting to "new arrivals"
#    Then Verify correct sorting
# 22
#  Scenario: Dog - Food - filter - Brand
#    Then In "Dog" menu go to "Food"
#    Then Set filter for "Brand"
#    Then Verify correct sorting
# 23
#  Scenario: Dog - Food - filter - Flavor
#    Then In "Dog" menu go to "Food"
#    Then Set filter for "Flavor"
#    Then Verify correct sorting
#24
#  Scenario: Dog - Food - filter - Breed
#    Then In "Dog" menu go to "Food"
#    Then Set filter for "Breed"
#    Then Verify correct sorting
#25
#  Scenario: Dog - Food - filter - Price
#    Then In "Dog" menu go to "Food"
#    Then Set filter for "Price"
#    Then Verify correct sorting
#26
#  Scenario: Dog - Food - filter - Rating
#    Then In "Dog" menu go to "Food"
#    Then Set filter for "Rating"
#    Then Verify correct sorting
#27
#  Scenario: Dog - Food - filter - Ways To Shop
#    Then In "Dog" menu go to "Food"
#    Then Set filter for "Ways to Shop"
#    Then Verify correct sorting
#28
#  Scenario: Dog - Food - filter - Health Consideration
#    Then In "Dog" menu go to "Food"
#    Then Set filter for "Health Consideration"
#    Then Verify correct sorting
#29
  Scenario: Dog - Food - comparing - adding 2 items
    Then In "Dog" menu go to "Food"
    Then Add 2 random items into compare mode
#30
  Scenario: Dog - Food - comparing - adding 3 items
    Then In "Dog" menu go to "Food"
    Then Add 3 random items into compare mode
#31
  Scenario: Dog - Food - comparing - adding more then 3 items
    Then In "Dog" menu go to "Food"
    Then Add 4 random items into compare mode
#32
  Scenario: Dog - Food - comparing - removing 1-3 items
    Then In "Dog" menu go to "Food"
    Then Add 3 random items into compare mode
    Then From compare mode remove 1st item  and verify that item was removed
    Then Tap Remove button to remove 2nd item ,  verify that item was removed
    Then Uncheck box  to remove 3d item  and verify that item was removed

#33
  Scenario: Dog - Shopping - 1 item to cart - all fine
    Then In "Dog" menu go to "Food"
    Then Add random item to card
    Then Choose size, flavor and quantity and add to cart
    Then Verify that 1 item in cart

##34
##  Scenario: Dog - Shopping - 1 item to cart - size, quantity and flavor not selected
#    Then In "Dog" menu go to "Food"
#    Then Add random item to card
#    Then Add to cart if size, quantity and flavor not selected
#    Then Verify that error messages notify user to select options
##35
##  Scenario: Dog - Shopping - 1 item to cart with removing
#    Then In "Dog" menu go to "Food"
#    Then Add random item to card
#    Then Choose size, flavor and quantity and add to cart
#    Then Remove item from cart and verify that no items in cart
##36
##  Scenario: Dog - Shopping - 1 item to cart with proceeding
#    Then In "Dog" menu go to "Food"
#    Then Add random item to card
#    Then Choose size, flavor and quantity and add to cart
#    Then Tap Checkout button and verify thet user on Checkout page
##37
##  Scenario: Dog - Shopping - more then 1 item to cart with removing of 1 item
##   Then In "Dog" menu go to "Food"
#    Then Add random  5 items to card
#    Then Choose size, flavor and quantity and add to cart
#    Then Remove  1 item from cart and verify that 4 items in cart
##
#
#
#
#
#
#
#
#
#
#
#







