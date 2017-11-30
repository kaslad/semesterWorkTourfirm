# This is the database of the Tourfirm website project.
# Entities
* USER(uses for registration/signing in)
* USER_INFORMATION and PASSPORT(uses for user profile)
* CITY(City list)
* NUTRITION(Types of nutritition), 
* HOTEL(All hotels that tourfirm uses)
* TOUR(Trip from city to city with fixed hotel)
* CONCRETE_TOUR(Extends tour with additional parameters like price, nutrition type for USER to choose proper option)
* RESERVATION(all reservations of concrete_tour made by user)
# Supporting tables
* Full_TOUR_INFO(joined table of TOUR, CONCRETE_TOUR, HOTEL, CITY, NUTRITION to search for all offers from tour Company)
* RESERVATION_EDIT - logging of operations INSERT, DELETE, UPDATE with the table.
* TOUR_EDIT
* USER_EDIT
# Database diagram
![Database diagram structure] (https://preview.ibb.co/eWdSpb/diagram.png)
