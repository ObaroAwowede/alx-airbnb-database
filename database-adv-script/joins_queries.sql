-- Inner join statement, the user's id, firsta nd last name,
-- as well as the booking status and price will be output in the result
SELECT User.user_id, User.first_name, User.last_name, Booking.status, Booking.total_price
From User
INNER JOIN Booking ON Booking.user_id = User.user_id;


-- Left join sql statement, the property id, property name, 
-- review rating and comment will be output in the result
SELECT Property.property_id, Property.name, Review.rating, Review.comment
FROM Property
LEFT JOIN Review ON Property.property_id = Review.property_id;

SELECT User.user_id, User.first_name, User.last_name, Booking.status, Booking.total_price
FROM User
FULL OUTER JOIN Booking ON Booking.user_id = User.user_id;