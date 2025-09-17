SELECT Property.name, Property.property_id
FROM Property
WHERE Property.property_id IN (
    SELECT Property.property_id, Review.rating
    FROM Review
    GROUP BY Property.property_id
    HAVING AVG(Review.rating) > 4.0
);