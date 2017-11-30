CREATE TABLE "user" (
  id       SERIAL      NOT NULL PRIMARY KEY,
  login    VARCHAR(20) NOT NULL UNIQUE,
  password TEXT        NOT NULL
);

CREATE TABLE user_information (
  name         VARCHAR(30),
  last_name    VARCHAR(30),
  father_name  VARCHAR(30),
  phone_number VARCHAR(30) NOT NULL,
  email        TEXT,
  user_id      INT         NOT NULL REFERENCES "user" (id) UNIQUE
);

CREATE TABLE city (
  id   SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);
CREATE TABLE passport (
  user_id           INT        NOT NULL REFERENCES "user" (id) UNIQUE,
  id                SERIAL     NOT NULL PRIMARY KEY,
  passport_series   VARCHAR(4) NOT NULL,
  passport_number   VARCHAR(6) NOT NULL,
  passport_who_gave TEXT       NOT NULL
);
CREATE TABLE hotel
(
  id          SERIAL PRIMARY KEY,
  name        VARCHAR(50) UNIQUE,
  count_star  INTEGER NOT NULL CHECK (count_star <= 5 AND count_star >= 0),
  description TEXT
);
CREATE TABLE tour
(
  id           SERIAL PRIMARY KEY,
  special_mark BOOLEAN NOT NULL,
  description  TEXT,
  from_city_id INT     NOT NULL REFERENCES city (id),
  to_city_id   INT     NOT NULL REFERENCES city (id),
  hotel_id     INT     NOT NULL REFERENCES hotel (id)
);

CREATE TABLE nutrition (
  id   SERIAL PRIMARY KEY,
  type VARCHAR(30) NOT NULL UNIQUE
)
CREATE TABLE concrete_tour (
  id           SERIAL PRIMARY KEY,
  nutrition_id INT                         NOT NULL REFERENCES nutrition (id),
  price        INT                         NOT NULL,
  date_start   TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  date_end     TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  tour_id      INT                         NOT NULL REFERENCES tour (id)
);

CREATE TABLE reservation (
  id               SERIAL PRIMARY KEY,
  user_id          INT                         NOT NULL REFERENCES "user" (id),
  concrete_tour_id INT                         NOT NULL REFERENCES concrete_tour (id),
  create_date      TIMESTAMP WITHOUT TIME ZONE NOT NULL

);
-- Inserts
INSERT INTO "user" (login, password) VALUES ('user', '1ae840819a8792fdf25575701c7d43e3');
INSERT INTO "user" (login, password) VALUES ('user2', '1ae840819a8792fdf25575701c7d43e3');
INSERT INTO "user" (login, password) VALUES ('user3', '1ae840819a8792fdf25575701c7d43e3');
INSERT INTO "user" (login, password) VALUES ('user4', '1ae840819a8792fdf25575701c7d43e3');
INSERT INTO "user" (login, password) VALUES ('user5', '1ae840819a8792fdf25575701c7d43e3');

INSERT INTO city (name) VALUES ('kazan');
INSERT INTO city (name) VALUES ('stambul');
INSERT INTO city (name) VALUES ('irkutsk');
INSERT INTO city (name) VALUES ('simferopol');
INSERT INTO city (name) VALUES ('spb');

INSERT INTO hotel (name, count_star, description) VALUES ('Hilton', '5', 'the best hotel');
INSERT INTO hotel (name, count_star, description) VALUES ('Ramadan', '4', 'the best view of the sea');
INSERT INTO hotel (name, count_star, description) VALUES ('Garden inn', '3', 'Good service');
INSERT INTO hotel (name, count_star, description) VALUES ('Tourkish hotel', '3', 'Good service');

INSERT INTO reservation (user_id, concrete_tour_id, create_date) VALUES (
  1, 1, '2017-11-23'
)
INSERT INTO reservation (user_id, concrete_tour_id, create_date) VALUES (
  3, 3, '2017-10-23'
);
INSERT INTO reservation (user_id, concrete_tour_id, create_date) VALUES (
  1, 5, '2017-10-23'
);
INSERT INTO reservation (user_id, concrete_tour_id, create_date) VALUES (
  1, 4, '2017-10-25'
);
INSERT INTO reservation (user_id, concrete_tour_id, create_date) VALUES (
  4, 4, '2017-10-23'
);
INSERT INTO reservation (user_id, concrete_tour_id, create_date) VALUES (
  4, 3, '2017-9-23'
);
INSERT INTO reservation (user_id, concrete_tour_id, create_date) VALUES (
  3, 21, '2017-9-23'
);
INSERT INTO reservation (user_id, concrete_tour_id, create_date) VALUES (
  3, 2, '2017-10-23'
);
INSERT INTO reservation (user_id, concrete_tour_id, create_date) VALUES (
  3, 2, '2017-11-23'
);
INSERT INTO reservation (user_id, concrete_tour_id, create_date) VALUES (
  3, 3, '2017-11-23'
);
INSERT INTO reservation (user_id, concrete_tour_id, create_date) VALUES (
  5, 13, '2017-11-24'
);
INSERT INTO reservation (user_id, concrete_tour_id, create_date) VALUES (
  5, 20, '2017-11-26'
);
INSERT INTO reservation (user_id, concrete_tour_id, create_date) VALUES (
  5, 14, '2017-11-27'
);
INSERT INTO reservation (user_id, concrete_tour_id, create_date) VALUES (
  5, 18, '2017-9-27'
);
INSERT INTO reservation (user_id, concrete_tour_id, create_date) VALUES (
  5, 17, '2017-10-27'
);
INSERT INTO reservation (user_id, concrete_tour_id, create_date) VALUES (
  5, 21, '2017-10-27'
);
INSERT INTO reservation (user_id, concrete_tour_id, create_date) VALUES (
  5, 13, '2017-11-27'
);
INSERT INTO reservation (user_id, concrete_tour_id, create_date) VALUES (
  4, 17, '2017-11-27'
);
INSERT INTO reservation (user_id, concrete_tour_id, create_date) VALUES (
  5, 19, '2017-11-27'
);
INSERT INTO reservation (user_id, concrete_tour_id, create_date) VALUES (
  4, 13, '2017-11-27'
);
INSERT INTO reservation (user_id, concrete_tour_id, create_date) VALUES (
  1, 17, '2017-11-27'
);


INSERT INTO passport (user_id, passport_series, passport_number, passport_who_gave) VALUES
  (3, '2532', '333333', 'РУВД');
INSERT INTO passport (user_id, passport_series, passport_number, passport_who_gave) VALUES
  (4, '2532', '333333', 'РУВД');

INSERT INTO user_information (name, last_name, father_name, phone_number, email, user_id)
VALUES ('vlad', 'kashirin', 'olegovich', '+79991561590', 'kashirinvlad@gmail.com', '1');
INSERT INTO user_information (name, last_name, father_name, phone_number, email, user_id)
VALUES ('vlad', 'kek', 'olegovich', '+79991561599', 'kashirinvlad@gmail.com', '2');
INSERT INTO user_information (name, last_name, father_name, phone_number, email, user_id)
VALUES ('vlados', 'shirin', 'olegovich', '+79991561590', 'kashirinvlad@gmail.com', '3');
INSERT INTO user_information (name, last_name, father_name, phone_number, email, user_id)
VALUES ('vlad', 'federer', 'olegovich', '+79991569590', 'kashirinvlad@gmail.com', '4');
INSERT INTO user_information (name, last_name, father_name, phone_number, email, user_id)
VALUES ('vlad', 'kashirin', 'olegovich', '+79991561590', 'kashirinvlad@gmail.com', '1')

INSERT INTO tour (special_mark, description, from_city_id, to_city_id, hotel_id) VALUES
  ('false', 'best tour to simferopol', 1, 4, 1);
INSERT INTO tour (special_mark, description, from_city_id, to_city_id, hotel_id) VALUES
  ('false', 'best tour to spb', 1, 5, 4);
INSERT INTO tour (special_mark, description, from_city_id, to_city_id, hotel_id) VALUES
  ('false', 'best tour to spb', 1, 5, 1);
INSERT INTO tour (special_mark, description, from_city_id, to_city_id, hotel_id) VALUES
  ('false', 'best tour to simferopol', 1, 4, 5);
INSERT INTO tour (special_mark, description, from_city_id, to_city_id, hotel_id) VALUES
  ('false', 'best tour to simferopol', 1, 4, 5);
INSERT INTO tour (special_mark, description, from_city_id, to_city_id, hotel_id) VALUES
  ('false', 'enjoy our full-packed tour to stambul', 3, 2, 6);
INSERT INTO tour (special_mark, description, from_city_id, to_city_id, hotel_id) VALUES
  ('false', 'best tour to kazan', 3, 1, 1);
INSERT INTO tour (special_mark, description, from_city_id, to_city_id, hotel_id) VALUES
  ('false', 'best tour to simferopol', 3, 4, 1);
INSERT INTO tour (special_mark, description, from_city_id, to_city_id, hotel_id) VALUES
  ('true', 'best tour to irkutsk', 2, 3, 1);
INSERT INTO tour (special_mark, description, from_city_id, to_city_id, hotel_id) VALUES
  ('true', 'best tour to kazan', 3, 1, 5);
INSERT INTO tour (special_mark, description, from_city_id, to_city_id, hotel_id) VALUES
  ('true', 'best tour to kazan', 3, 1, 4);

INSERT INTO nutrition (type) VALUES ('AI');
INSERT INTO nutrition (type) VALUES ('HB');
INSERT INTO nutrition (type) VALUES ('BB');
INSERT INTO nutrition (type) VALUES ('FB');

INSERT INTO concrete_tour (nutrition_id, price, date_start, date_end, tour_id) VALUES (
  1, 300, '2018-02-17', '2018-02-23', 28);
INSERT INTO concrete_tour (nutrition_id, price, date_start, date_end, tour_id) VALUES (
  1, 300, '2018-01-19', '2018-02-25', 27);

INSERT INTO concrete_tour (nutrition_id, price, date_start, date_end, tour_id) VALUES (
  1, 500, '2018-03-17', '2018-03-29', 34);
INSERT INTO concrete_tour (nutrition_id, price, date_start, date_end, tour_id) VALUES (
  1, 700, '2018-02-17', '2018-02-27', 34);
INSERT INTO concrete_tour (nutrition_id, price, date_start, date_end, tour_id) VALUES (
  1, 300, '2018-01-17', '2018-01-23', 33);
INSERT INTO concrete_tour (nutrition_id, price, date_start, date_end, tour_id) VALUES (
  1, 300, '2018-01-17', '2018-01-23', 28);