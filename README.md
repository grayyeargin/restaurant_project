restaurant_project
==================

A restaurant management application that lists current menu items, table usage, and outstanding orders. Using Sinatra sessions and authorization, an authorized viewer can create, update, view, and delete parties, menu items, and orders while an unauthoried user can only see the menu and table availability.

The user is able to create, edit, and remove menu items. 
![ScreenShot](https://github.com/grayyeargin/restaurant_project/blob/master/public/images/menu.png)


The user can add or remove parties from tables and edit menu items ordered.![ScreenShot](https://github.com/grayyeargin/restaurant_project/blob/master/public/images/parties.png) 

Validation is used to check unwanted data manipulation. ![ScreenShot](https://github.com/grayyeargin/restaurant_project/blob/master/public/images/spicoli_error.png)

A chef always needs to know what still needs to be cooked. Here they can check outstanding orders and with a click remove them from the list. ![ScreenShot](https://github.com/grayyeargin/restaurant_project/blob/master/public/images/orders.png)

You're welcome chefs.

At checkout, a receipt will be printed to a text file as well as stored with previous receipts in a seperate file.

The application is built with Ruby, Sinatra, Javascript and utilizing postgresql for database management.