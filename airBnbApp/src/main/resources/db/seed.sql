-- Seed data for airbnbDB (hotel-booking-system)
-- All users have password: password123
--
-- Assumes empty tables (uses explicit IDs 1..N). To re-seed, wipe first:
--   docker exec airbnb-db psql -U user -d airbnbDB -c "TRUNCATE booking_guest, booking, guest, hotel_min_price, inventory, room, hotel, user_roles, app_user RESTART IDENTITY CASCADE;"
-- Then run:
--   docker exec -i airbnb-db psql -U user -d airbnbDB -v ON_ERROR_STOP=1 < airBnbApp/src/main/resources/db/seed.sql
BEGIN;

-- ---------- USERS ----------
INSERT INTO app_user (id, email, password, name, date_of_birth, gender) VALUES
(1, 'rajesh.manager@example.com',  '$2y$10$PfMa1tb75w6zC.OOLTiEGu2Ogw3UbWbfP7IoohKE1ZzDzgqIu2QR2', 'Rajesh Sharma', '1985-04-12', 'MALE'),
(2, 'priya.manager@example.com',   '$2y$10$PfMa1tb75w6zC.OOLTiEGu2Ogw3UbWbfP7IoohKE1ZzDzgqIu2QR2', 'Priya Nair',    '1990-08-25', 'FEMALE'),
(3, 'amit.kumar@example.com',      '$2y$10$PfMa1tb75w6zC.OOLTiEGu2Ogw3UbWbfP7IoohKE1ZzDzgqIu2QR2', 'Amit Kumar',    '1995-01-30', 'MALE'),
(4, 'sneha.gupta@example.com',     '$2y$10$PfMa1tb75w6zC.OOLTiEGu2Ogw3UbWbfP7IoohKE1ZzDzgqIu2QR2', 'Sneha Gupta',   '1998-11-05', 'FEMALE'),
(5, 'vikram.singh@example.com',    '$2y$10$PfMa1tb75w6zC.OOLTiEGu2Ogw3UbWbfP7IoohKE1ZzDzgqIu2QR2', 'Vikram Singh',  '1992-06-18', 'MALE');

INSERT INTO user_roles (user_id, roles) VALUES
(1, 'HOTEL_MANAGER'), (1, 'GUEST'),
(2, 'HOTEL_MANAGER'), (2, 'GUEST'),
(3, 'GUEST'), (4, 'GUEST'), (5, 'GUEST');

-- ---------- HOTELS ----------
INSERT INTO hotel (id, name, city, photos, amenities, address, phone_number, email, location, active, owner_id, created_at, updated_at) VALUES
(1, 'Taj Palace Mumbai', 'Mumbai',
 ARRAY['https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=1200&q=80',
       'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?auto=format&fit=crop&w=1200&q=80',
       'https://images.unsplash.com/photo-1571896349842-33c89424de2d?auto=format&fit=crop&w=1200&q=80'],
 ARRAY['Free WiFi','Swimming Pool','Spa','Gym','Restaurant','Room Service','Parking'],
 'Apollo Bunder, Colaba, Mumbai 400001', '+91 22 6665 3366', 'stay@tajpalacemumbai.com', '18.9220,72.8332',
 true, 1, now(), now()),

(2, 'The Grand Oberoi', 'Delhi',
 ARRAY['https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?auto=format&fit=crop&w=1200&q=80',
       'https://images.unsplash.com/photo-1551882547-ff40c63fe5fa?auto=format&fit=crop&w=1200&q=80',
       'https://images.unsplash.com/photo-1445019980597-93fa8acb246c?auto=format&fit=crop&w=1200&q=80'],
 ARRAY['Free WiFi','Rooftop Bar','Spa','Gym','Fine Dining','Concierge','Valet Parking'],
 'Dr. Zakir Hussain Marg, New Delhi 110003', '+91 11 2436 3030', 'reservations@grandoberoi.com', '28.6027,77.2410',
 true, 1, now(), now()),

(3, 'The Leela Palace', 'Bangalore',
 ARRAY['https://images.unsplash.com/photo-1564501049412-61c2a3083791?auto=format&fit=crop&w=1200&q=80',
       'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?auto=format&fit=crop&w=1200&q=80',
       'https://images.unsplash.com/photo-1568084680786-a84f91d1153c?auto=format&fit=crop&w=1200&q=80'],
 ARRAY['Free WiFi','Swimming Pool','Business Center','Gym','Multi-cuisine Restaurant','Airport Shuttle'],
 '23 HAL Old Airport Road, Bangalore 560008', '+91 80 2521 1234', 'bookings@leelapalaceblr.com', '12.9606,77.6484',
 true, 1, now(), now()),

(4, 'Sea Breeze Beach Resort', 'Goa',
 ARRAY['https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?auto=format&fit=crop&w=1200&q=80',
       'https://images.unsplash.com/photo-1540541338287-41700207dee6?auto=format&fit=crop&w=1200&q=80',
       'https://images.unsplash.com/photo-1521783988139-89397d761dce?auto=format&fit=crop&w=1200&q=80'],
 ARRAY['Beach Access','Free WiFi','Infinity Pool','Water Sports','Beach Bar','Spa'],
 'Calangute Beach Road, North Goa 403516', '+91 832 227 6054', 'hello@seabreezegoa.com', '15.5439,73.7553',
 true, 2, now(), now()),

(5, 'Royal Heritage Haveli', 'Jaipur',
 ARRAY['https://images.unsplash.com/photo-1477587458883-47145ed94245?auto=format&fit=crop&w=1200&q=80',
       'https://images.unsplash.com/photo-1596386461350-326ccb383e9f?auto=format&fit=crop&w=1200&q=80',
       'https://images.unsplash.com/photo-1599661046289-e31897846e41?auto=format&fit=crop&w=1200&q=80'],
 ARRAY['Heritage Architecture','Free WiFi','Courtyard Pool','Cultural Shows','Rooftop Restaurant','Parking'],
 'Jacob Road, Civil Lines, Jaipur 302006', '+91 141 222 1234', 'stay@royalhaveli.com', '26.9124,75.7873',
 true, 2, now(), now()),

(6, 'Marina Bay Suites', 'Mumbai',
 ARRAY['https://images.unsplash.com/photo-1582719508461-905c673771fd?auto=format&fit=crop&w=1200&q=80',
       'https://images.unsplash.com/photo-1611892440504-42a792e24d32?auto=format&fit=crop&w=1200&q=80',
       'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=1200&q=80'],
 ARRAY['Sea View','Free WiFi','Rooftop Pool','Gym','Cafe','24x7 Front Desk'],
 'Marine Drive, Nariman Point, Mumbai 400021', '+91 22 4033 4455', 'contact@marinabaysuites.com', '18.9256,72.8242',
 true, 2, now(), now());

-- ---------- ROOMS ----------
INSERT INTO room (id, hotel_id, type, base_price, photos, amenities, total_count, capacity, created_at, updated_at) VALUES
-- Taj Palace Mumbai
(1, 1, 'Deluxe Room', 8500.00,
 ARRAY['https://images.unsplash.com/photo-1611892440504-42a792e24d32?auto=format&fit=crop&w=1200&q=80',
       'https://images.unsplash.com/photo-1590490360182-c33d57733427?auto=format&fit=crop&w=1200&q=80'],
 ARRAY['King Bed','Sea View','Mini Bar','Smart TV','Air Conditioning'], 10, 2, now(), now()),
(2, 1, 'Executive Suite', 15000.00,
 ARRAY['https://images.unsplash.com/photo-1578683010236-d716f9a3f461?auto=format&fit=crop&w=1200&q=80',
       'https://images.unsplash.com/photo-1591088398332-8a7791972843?auto=format&fit=crop&w=1200&q=80'],
 ARRAY['King Bed','Living Area','Bathtub','Butler Service','Sea View'], 5, 3, now(), now()),
-- The Grand Oberoi
(3, 2, 'Premier Room', 9500.00,
 ARRAY['https://images.unsplash.com/photo-1618773928121-c32242e63f39?auto=format&fit=crop&w=1200&q=80',
       'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?auto=format&fit=crop&w=1200&q=80'],
 ARRAY['Queen Bed','City View','Work Desk','Rain Shower','Smart TV'], 12, 2, now(), now()),
(4, 2, 'Luxury Suite', 18000.00,
 ARRAY['https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?auto=format&fit=crop&w=1200&q=80',
       'https://images.unsplash.com/photo-1560185007-cde436f6a4d0?auto=format&fit=crop&w=1200&q=80'],
 ARRAY['King Bed','Private Balcony','Jacuzzi','Lounge Access','Butler Service'], 4, 4, now(), now()),
-- The Leela Palace
(5, 3, 'Standard Room', 6500.00,
 ARRAY['https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?auto=format&fit=crop&w=1200&q=80',
       'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?auto=format&fit=crop&w=1200&q=80'],
 ARRAY['Queen Bed','Garden View','Work Desk','Air Conditioning'], 15, 2, now(), now()),
(6, 3, 'Royal Club Room', 11000.00,
 ARRAY['https://images.unsplash.com/photo-1598928506311-c55ded91a20c?auto=format&fit=crop&w=1200&q=80',
       'https://images.unsplash.com/photo-1560185127-6ed189bf02f4?auto=format&fit=crop&w=1200&q=80'],
 ARRAY['King Bed','Club Lounge Access','Pool View','Bathtub','Mini Bar'], 8, 3, now(), now()),
-- Sea Breeze Beach Resort
(7, 4, 'Garden Cottage', 5500.00,
 ARRAY['https://images.unsplash.com/photo-1587985064135-0366536eab42?auto=format&fit=crop&w=1200&q=80',
       'https://images.unsplash.com/photo-1566665797739-1674de7a421a?auto=format&fit=crop&w=1200&q=80'],
 ARRAY['Queen Bed','Private Garden','Outdoor Shower','Hammock'], 10, 2, now(), now()),
(8, 4, 'Beach Villa', 12500.00,
 ARRAY['https://images.unsplash.com/photo-1602002418082-a4443e081dd1?auto=format&fit=crop&w=1200&q=80',
       'https://images.unsplash.com/photo-1615880484746-a134be9a6ecf?auto=format&fit=crop&w=1200&q=80'],
 ARRAY['King Bed','Beachfront','Private Plunge Pool','Sun Deck'], 6, 4, now(), now()),
-- Royal Heritage Haveli
(9, 5, 'Heritage Room', 4500.00,
 ARRAY['https://images.unsplash.com/photo-1519449556851-5720b33024e7?auto=format&fit=crop&w=1200&q=80',
       'https://images.unsplash.com/photo-1631049307264-da0ec9d70304?auto=format&fit=crop&w=1200&q=80'],
 ARRAY['Traditional Decor','Queen Bed','Courtyard View','Air Conditioning'], 12, 2, now(), now()),
(10, 5, 'Maharaja Suite', 9000.00,
 ARRAY['https://images.unsplash.com/photo-1590073242678-70ee3fc28e8e?auto=format&fit=crop&w=1200&q=80',
       'https://images.unsplash.com/photo-1601565415267-724db0e9fbdf?auto=format&fit=crop&w=1200&q=80'],
 ARRAY['Royal Decor','King Bed','Private Terrace','Bathtub','Butler Service'], 3, 4, now(), now()),
-- Marina Bay Suites
(11, 6, 'City View Room', 7000.00,
 ARRAY['https://images.unsplash.com/photo-1631049035182-249067d7618e?auto=format&fit=crop&w=1200&q=80',
       'https://images.unsplash.com/photo-1631049552057-403cdb8f0658?auto=format&fit=crop&w=1200&q=80'],
 ARRAY['Queen Bed','City View','Smart TV','Coffee Maker'], 14, 2, now(), now()),
(12, 6, 'Sea View Suite', 13500.00,
 ARRAY['https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?auto=format&fit=crop&w=1200&q=80',
       'https://images.unsplash.com/photo-1560200353-ce0a76b1d438?auto=format&fit=crop&w=1200&q=80'],
 ARRAY['King Bed','Panoramic Sea View','Living Area','Bathtub','Mini Bar'], 7, 3, now(), now());

-- ---------- INVENTORY (today -> +120 days, one row per room per day) ----------
INSERT INTO inventory (hotel_id, room_id, date, booked_count, reserved_count, total_count, surge_factor, price, city, closed, created_at, updated_at)
SELECT r.hotel_id, r.id, d::date, 0, 0, r.total_count, 1.00, r.base_price, h.city, false, now(), now()
FROM room r
JOIN hotel h ON h.id = r.hotel_id
CROSS JOIN generate_series(CURRENT_DATE, CURRENT_DATE + INTERVAL '120 days', INTERVAL '1 day') d;

-- ---------- HOTEL MIN PRICE (cheapest room per hotel per day) ----------
INSERT INTO hotel_min_price (hotel_id, date, price, created_at, updated_at)
SELECT i.hotel_id, i.date, MIN(i.price), now(), now()
FROM inventory i
GROUP BY i.hotel_id, i.date;

-- ---------- GUESTS ----------
INSERT INTO guest (id, user_id, name, gender, date_of_birth, created_at, updated_at) VALUES
(1, 3, 'Amit Kumar',    'MALE',   '1995-01-30', now(), now()),
(2, 3, 'Neha Kumar',    'FEMALE', '1996-03-14', now(), now()),
(3, 4, 'Sneha Gupta',   'FEMALE', '1998-11-05', now(), now()),
(4, 4, 'Rohan Gupta',   'MALE',   '1997-07-22', now(), now()),
(5, 5, 'Vikram Singh',  'MALE',   '1992-06-18', now(), now()),
(6, 5, 'Anjali Singh',  'FEMALE', '1994-02-09', now(), now());

-- ---------- BOOKINGS ----------
INSERT INTO booking (id, hotel_id, room_id, user_id, rooms_count, check_in_date, check_out_date, booking_status, amount, payment_session_id, created_at, updated_at) VALUES
(1, 1, 1, 3, 1, CURRENT_DATE + 7,  CURRENT_DATE + 10, 'CONFIRMED', 25500.00, 'cs_test_seed_0001', now(), now()),
(2, 4, 8, 4, 1, CURRENT_DATE + 14, CURRENT_DATE + 18, 'CONFIRMED', 50000.00, 'cs_test_seed_0002', now(), now()),
(3, 5, 9, 5, 2, CURRENT_DATE + 30, CURRENT_DATE + 32, 'CONFIRMED', 18000.00, 'cs_test_seed_0003', now(), now());

INSERT INTO booking_guest (booking_id, guest_id) VALUES
(1, 1), (1, 2),
(2, 3), (2, 4),
(3, 5), (3, 6);

-- Reflect confirmed bookings in inventory (booked nights = check-in to check-out - 1)
UPDATE inventory SET booked_count = booked_count + 1, updated_at = now()
WHERE room_id = 1 AND date >= CURRENT_DATE + 7  AND date < CURRENT_DATE + 10;
UPDATE inventory SET booked_count = booked_count + 1, updated_at = now()
WHERE room_id = 8 AND date >= CURRENT_DATE + 14 AND date < CURRENT_DATE + 18;
UPDATE inventory SET booked_count = booked_count + 2, updated_at = now()
WHERE room_id = 9 AND date >= CURRENT_DATE + 30 AND date < CURRENT_DATE + 32;

-- ---------- FIX IDENTITY SEQUENCES ----------
SELECT setval(pg_get_serial_sequence('app_user','id'),        (SELECT MAX(id) FROM app_user));
SELECT setval(pg_get_serial_sequence('hotel','id'),           (SELECT MAX(id) FROM hotel));
SELECT setval(pg_get_serial_sequence('room','id'),            (SELECT MAX(id) FROM room));
SELECT setval(pg_get_serial_sequence('inventory','id'),       (SELECT MAX(id) FROM inventory));
SELECT setval(pg_get_serial_sequence('hotel_min_price','id'), (SELECT MAX(id) FROM hotel_min_price));
SELECT setval(pg_get_serial_sequence('guest','id'),           (SELECT MAX(id) FROM guest));
SELECT setval(pg_get_serial_sequence('booking','id'),         (SELECT MAX(id) FROM booking));

COMMIT;
