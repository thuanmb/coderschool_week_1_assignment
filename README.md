# Required User Stories
- The User must be able to go two pages: Menu, and Contact Us.
- The User can see the address and phone number on the contact us page.
- The User can see a basic google map on the Contact Us page.
- The User can navigate to a menu page with four sections:
	- Breakfast
	- Lunch
	- Dinner
	- Drinks
- The user should see at least 5 food items in each section.
- Each food item should have the following fields:
	- Name (Canh Chua)
	- Description (Delicious fish soup)
	- Price (VND)
	- Section - Breakfast, Lunch, Dinner, Drinks
	- Image URL - do a google search or use LoremFlickr: http://loremflickr.com/320/240/canhchua
 
**Note: You may have to add extra fields to the MenuItem model to accomplish the bonus extra tasks.**

- The User should be able to filter by section of Breakfast, Lunch, Dinner, or Drinks and see only the relevant items.
- The User can sort menu items by “alphabetical”, “price low to high”, and “price high to low”.
- The User should be able to get for a menu item and see results.

- Clicking on an item in the menu brings up its detail, where you see the description and a larger picture.
- The User can click “order” on a menu item to go to a “Create Order” page.
- The User is able to fill in their name, phone number, and address.
- The User is taken to a “Thank you for your order page” that lists the name of item, the total cost (delivery should cost 20,000 VND), the user’s name, the user’s address, and the time the order was created in human-readable format (for example, Tuesday, December 1, 15:25).

# Bonus User Stories
- The User can also filter by type of Cuisine.
- The User can see how many times each menu item has been viewed, and sort items by “most viewed”.
- The user can input “CODERSCHOOL” as a coupon code on the order page, which should give a 50% discount off of the order.