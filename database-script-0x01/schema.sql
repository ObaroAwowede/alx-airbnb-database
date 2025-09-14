CREATE TABLE IF NOT EXISTS User(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(215) NOT NULL,
    last_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL,
    password_hash VARCHAR(215) NOT NULL,
    phone_number VARCHAR(215) NOT NULL,
    role ENUM('guest','host','admin') NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT users_email UNIQUE (email)
)

CREATE TABLE IF NOT EXISTS Property (
  property_id INT PRIMARY KEY AUTO_INCREMENT,
  host_id INT NOT NULL,
  name VARCHAR(215) NOT NULL,
  description TEXT NOT NULL,
  location VARCHAR(215) NOT NULL,
  pricepernight DECIMAL(10,2) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX idx_property_host_id (host_id),
  CONSTRAINT fk_property_host
    FOREIGN KEY (host_id) REFERENCES User(user_id)
    ON DELETE CASCADE
)

CREATE TABLE IF NOT EXISTS Booking (
  booking_id INT PRIMARY KEY AUTO_INCREMENT,
  property_id INT NOT NULL,
  user_id INT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  total_price DECIMAL(10,2) NOT NULL,
  status ENUM('pending','confirmed','canceled') NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_bookings_property_id (property_id),
  INDEX idx_bookings_user_id (user_id),
  CONSTRAINT fk_booking_property
    FOREIGN KEY (property_id) REFERENCES Property(property_id)
    ON DELETE CASCADE,
  CONSTRAINT fk_booking_user
    FOREIGN KEY (user_id) REFERENCES User(user_id)
    ON DELETE CASCADE
)

CREATE TABLE IF NOT EXISTS Payment (
  payment_id INT PRIMARY KEY AUTO_INCREMENT,
  booking_id INT NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  payment_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  payment_method ENUM('credit_card','paypal','stripe') NOT NULL,
  INDEX idx_payments_booking_id (booking_id),
  CONSTRAINT fk_payments_booking
    FOREIGN KEY (booking_id) REFERENCES BOOKING(booking_id)
    ON DELETE CASCADE
)

CREATE TABLE IF NOT EXISTS Review (
  review_id INT PRIMARY KEY AUTO_INCREMENT,
  property_id INT NOT NULL,
  user_id INT NOT NULL,
  rating INT NOT NULL,
  comment TEXT NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_review_property_id (property_id),
  INDEX idx_review_user_id (user_id),
  CONSTRAINT check_reviews_rating CHECK (rating >= 1 AND rating <= 5),
  CONSTRAINT fk_reviews_property
    FOREIGN KEY (property_id) REFERENCES Property(property_id)
    ON DELETE CASCADE,
  CONSTRAINT fk_reviews_user
    FOREIGN KEY (user_id) REFERENCES User(user_id)
    ON DELETE CASCADE
)

CREATE TABLE IF NOT EXISTS Message (
  message_id INT PRIMARY KEY AUTO_INCREMENT,
  sender_id INT NOT NULL,
  recipient_id INT NOT NULL,
  message_body TEXT NOT NULL,
  sent_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_messages_sender_id (sender_id),
  INDEX idx_messages_recipient_id (recipient_id),
  
  CONSTRAINT fk_messages_sender
    FOREIGN KEY (sender_id) REFERENCES User(user_id)
    ON DELETE CASCADE,
  CONSTRAINT fk_messages_recipient
    FOREIGN KEY (recipient_id) REFERENCES User(user_id)
    ON DELETE CASCADE
)