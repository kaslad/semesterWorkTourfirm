views
--1 the most popular tours
CREATE VIEW tour_amount_of_reservations AS
  SELECT
    t.id           AS tour_id,
    city_from.name AS city_from,
    city_to.name   AS city_to,
    count(*)       AS cnt
  FROM reservation AS res
    JOIN concrete_tour AS c ON c.id = res.concrete_tour_id
    JOIN tour AS t ON t.id = c.tour_id
    JOIN city AS city_from ON t.from_city_id = city_from.id
    JOIN city AS city_to ON city_to.id = t.to_city_id
  GROUP BY t.id, city_from.name, city_to.name
  ORDER BY cnt DESC;
SELECT *
FROM tour_amount_of_reservations;

--2 users sorted by amount of orders for previous month
CREATE VIEW top_users_last_month AS
  SELECT
    u.login,
    count(*) AS cnt
  FROM reservation AS res
    JOIN "user" AS u ON u.id = res.user_id
  WHERE
    extract(MONTH FROM res.date) = extract(MONTH FROM CURRENT_DATE - '1 month' :: INTERVAL)
  GROUP BY u.login, u.id
  ORDER BY cnt DESC;

--3 average price of user reservation
CREATE VIEW user_avg_tour_price AS
  SELECT
    u.login,
    round(avg(c.price), 0) AS avg_price
  FROM reservation AS res
    JOIN "user" AS u ON u.id = res.user_id
    JOIN concrete_tour AS c ON
                              res.concrete_tour_id = c.id
  GROUP BY u.login
  ORDER BY avg_price DESC;
SELECT *
FROM user_avg_tour_price;
