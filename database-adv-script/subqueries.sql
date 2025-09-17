SELECT Property.name, Property.property_id
FROM Property
WHERE Property.property_id IN (
    SELECT Property.property_id, Review.rating
    FROM Review
    GROUP BY Property.property_id
    HAVING AVG(Review.rating) > 4.0
);

SELECT User.user_id, User.first_name, Booking.booking_id, Booking.status
FROM `User` 
JOIN Booking ON User.user_id = Booking.user_id
WHERE (
    SELECT COUNT(*)
    From Booking
    WHERE User.user_id = Booking.user_id
) > 3;