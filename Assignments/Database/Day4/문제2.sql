CREATE TABLE pet_owners (
    owner_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    contact VARCHAR(20),
    email VARCHAR(100),
    PRIMARY KEY (owner_id)
);

CREATE TABLE pets (
    pet_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    breed VARCHAR(45),
    age INT,
    owner_id INT NOT NULL,
    PRIMARY KEY (pet_id),
    CONSTRAINT fk_pets_owner FOREIGN KEY (owner_id) 
        REFERENCES pet_owners (owner_id) ON DELETE CASCADE
);

CREATE TABLE rooms (
    room_id INT NOT NULL AUTO_INCREMENT,
    room_number VARCHAR(45) NOT NULL,
    room_type VARCHAR(45),
    price_per_night DECIMAL(10,2),
    PRIMARY KEY (room_id)
);

CREATE TABLE reservations (
    reservation_id INT NOT NULL AUTO_INCREMENT,
    start_date DATE,
    end_date DATE,
    pet_id INT NOT NULL,
    room_id INT NOT NULL,
    PRIMARY KEY (reservation_id),
    CONSTRAINT fk_res_pet FOREIGN KEY (pet_id) 
        REFERENCES pets (pet_id) ON DELETE CASCADE,
    CONSTRAINT fk_res_room FOREIGN KEY (room_id) 
        REFERENCES rooms (room_id) ON DELETE CASCADE
);

CREATE TABLE services (
    service_id INT NOT NULL AUTO_INCREMENT,
    service_name VARCHAR(45) NOT NULL,
    service_price DECIMAL(10,2),
    reservation_id INT NOT NULL,
    PRIMARY KEY (service_id),
    CONSTRAINT fk_service_res FOREIGN KEY (reservation_id) 
        REFERENCES reservations (reservation_id) ON DELETE CASCADE
);