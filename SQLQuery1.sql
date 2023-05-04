use Hoteli

CREATE TABLE rooms (
    room_id INT PRIMARY KEY,
    room_type VARCHAR(50) NOT NULL,
    room_number INT NOT NULL,
    occupancy INT NOT NULL,
    bed_type VARCHAR(50) NOT NULL,
    smoking_status VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    [availability] bit NOT NULL,
    last_maintenance_date DATE NOT NULL
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    address VARCHAR(200) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    postal_code VARCHAR(20) NOT NULL
);

CREATE TABLE reservations (
    reservation_id INT PRIMARY KEY,
    room_id INT NOT NULL,
    customer_id INT NOT NULL,
    checkin_date DATE NOT NULL,
    checkout_date DATE NOT NULL,
    num_guests INT NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    reservation_date DATE NOT NULL,
    FOREIGN KEY (room_id) REFERENCES rooms(room_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    reservation_id INT NOT NULL,
    customer_id INT NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    payment_amount DECIMAL(10,2) NOT NULL,
    payment_date DATE NOT NULL,
    FOREIGN KEY (reservation_id) REFERENCES reservations(reservation_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE food_items (
    item_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(200),
    price DECIMAL(10,2) NOT NULL,
    category VARCHAR(50) NOT NULL
);

CREATE TABLE food_calendar (
    calendar_id INT PRIMARY KEY,
    date DATE NOT NULL,
    item_id INT NOT NULL,
    meal_time VARCHAR(50) NOT NULL,
    FOREIGN KEY (item_id) REFERENCES food_items(item_id)
);

CREATE TABLE food_orders (
    order_id INT PRIMARY KEY,
    room_id INT NOT NULL,
    item_id INT NOT NULL,
    quantity INT NOT NULL,
    order_time TIMESTAMP NOT NULL,
    status VARCHAR(50) NOT NULL,
    FOREIGN KEY (room_id) REFERENCES rooms(room_id),
    FOREIGN KEY (item_id) REFERENCES food_items(item_id)
);

CREATE TABLE staff (
    staff_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    job_title VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL
);

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(50) NOT NULL,
    user_type VARCHAR(50) NOT NULL,
    staff_customer_id INT,
    FOREIGN KEY (staff_customer_id) REFERENCES staff(staff_id) ON DELETE CASCADE,
    FOREIGN KEY (staff_customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);
