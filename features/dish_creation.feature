Feature: As a restaurant Owner
  in order to set up my menu
  I need to be able to create Dishes.

Scenario: I create a dish
  Given I am on the "Create Dish" page
  Then I should see:
    | content             |
    | Add a Dish          |
    | Dish Name           |
    | Dish description    |
    | Price               |
    | Allergy Info        |
    | Ingredients         |
    | Calories            |
  When I fill in:
    | element          | content              |
    | Dish Name        | Pizza                |
    | Dish description | Delicious pizza      |
    | Price            | 7000kr               |
    | Allergy Info     | gluten               |
    | Ingredients      | cheese, sauce, crust |
    | Calories         | 10000                |
  When I click the "Add a Dish" button
  Then I should be on the dish page for "Pizza"
  And I should see:
    | content              |
    | Pizza                |
    | Delicious pizza      |
    | 7000                 |
    | gluten               |
    | cheese, sauce, crust |
    | 10000                |
  Then I should see "Add to cart" link

Scenario: I attempt to create a dish with bad info
  Given I am on the "Create Dish" page
  When I fill in:
    | element          | content              |
    | Dish Name        |                      |
    | Dish description | Delicious pizza      |
    | Price            | 7000kr               |
  When I click the "Add a Dish" button
  Then I should see "Dish name can't be blank"

Scenario: I attempt to create a dish without description
  Given I am on the "Create Dish" page
  When I fill in:
    | element          | content              |
    | Dish Name        | Pizza                |
    | Dish description |                      |
    | Price            | 7000kr               |
  When I click the "Add a Dish" button
  Then I should see "Dish desc can't be blank"

Scenario: I attempt to create a dish without price
  Given I am on the "Create Dish" page
  When I fill in:
    | element          | content              |
    | Dish Name        | pizza                |
    | Dish description | Delicious pizza      |
    | Price            |                      |
  When I click the "Add a Dish" button
  Then I should see "Dish price can't be blank"
