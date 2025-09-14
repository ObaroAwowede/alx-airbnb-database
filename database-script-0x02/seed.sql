INSERT INTO `User` (user_id,first_name,last_name,email,password_hash,phone_number,role)
VALUES 
    (1,'michael','johnson','mikejohn@gmail.com','iammike','09022345899','host'),
    (2,'james','potter','jamesp@gmail.com','iamjames','09011234543', 'host'),
    (3,'kyrie','irving','kaiflatearth@gmail.com','iamkai','0902234556', 'guest')

INSERT INTO Property (host_id,name,description,location,pricepernight)
VALUES 
    (1, 'Beach House', 'It is a beach house brev','Lagos', 150),
    (1, 'Cozy Studio', 'A small cozy studio in the city center', 'Lagos', 30.00),
    (2, 'Beach House', 'Spacious house with beach view', 'Lekki', 120.00);

INSERT INTO Booking (property_id, user_id, start_date, end_date, total_price, status)
VALUES
  (1, 2, '2025-10-01', '2025-10-05', 120.00, 'confirmed'),
  (2, 3, '2025-11-15', '2025-11-20', 600.00, 'pending');

INSERT INTO Payment (booking_id, amount, payment_method)
VALUES
  (1, 120.00, 'credit_card'),
  (2, 300.00, 'paypal');

INSERT INTO Review (property_id, user_id, rating, comment)
VALUES
  (1, 2, 5, 'Excellent stay, very clean'),
  (2, 3, 4, 'Great view, a bit noisy');

INSERT INTO Message (sender_id, recipient_id, message_body)
VALUES
  (2, 1, 'Hi, is the house available for early check-in?'),
  (1, 2, 'Yes, early check-in is possible for a small fee.');
