-- denormalized table: join of hotel, tour, concrete_tour
-- preparation of table
CREATE TABLE full_tour_info AS
  SELECT
    c.id,
    from_city.name AS from_city,
    to_city.name   AS to_city,
    c.price,
    c.date_start,
    c.date_end,
    t.description  AS tour_description,
    h.description  AS hotel_description,
    h.count_star   AS hotel_rating,
    t.special_mark AS sale,
    n.type         AS nutrition
  FROM tour AS t
    JOIN hotel AS h ON t.hotel_id = h.id
    JOIN city from_city ON from_city.id = t.from_city_id
    JOIN city AS to_city ON to_city.id = t.to_city_id
    JOIN concrete_tour AS c ON t.id = c.tour_id
    JOIN nutrition AS n ON c.nutrition_id = n.id;
TRUNCATE TABLE full_tour_info;
ALTER TABLE full_tour_info
  ADD PRIMARY KEY (id);
CREATE SEQUENCE full_tour_info_seq START WITH 1;
ALTER TABLE full_tour_info
  ALTER COLUMN id SET DEFAULT nextval('full_tour_info_seq');


-- function of filling denormalized table
CREATE OR REPLACE FUNCTION full_tour_info_filling()
  RETURNS TABLE(
    id                INT,
    from_city         TEXT,
    to_city           TEXT,
    price             INTEGER,
    date_start        TIMESTAMP,
    date_end          TIMESTAMP,
    tour_description  TEXT,
    hotel_description TEXT,
    hotel_rating      INTEGER,
    sale              BOOLEAN,
    nutrition         VARCHAR(30)


  ) AS $$

BEGIN
  TRUNCATE full_tour_info;


  INSERT INTO full_tour_info
    SELECT
      c.id,
      from_city.name AS from_city,
      to_city.name   AS to_city,
      c.price,
      c.date_start,
      c.date_end,
      t.description  AS tour_description,
      h.description  AS hotel_description,
      h.count_star   AS hotel_rating,
      t.special_mark AS sale,
      n.type         AS nutrition
    FROM tour AS t
      JOIN hotel AS h ON t.hotel_id = h.id
      JOIN city from_city ON from_city.id = t.from_city_id
      JOIN city AS to_city ON to_city.id = t.to_city_id
      JOIN concrete_tour AS c ON t.id = c.tour_id
      JOIN nutrition AS n ON c.nutrition_id = n.id;
  RETURN QUERY SELECT *
               FROM full_tour_info;
END;
$$ LANGUAGE 'plpgsql';
-- call func
SELECT *
FROM full_tour_info_filling();