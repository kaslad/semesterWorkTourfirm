CREATE INDEX tour_from_to_city_idx
  ON tour (from_city_id, to_city_id);


CREATE INDEX special_tour_from_to_city_idx
  ON tour (from_city_id, to_city_id)
  WHERE special_mark IS TRUE;


CREATE INDEX conc_tour_price_date_idx
  ON concrete_tour (price, date_start);

--CREATE INDEX conc_tour_price_date_tour_id_idx ON concrete_tour(price,date_start,tour_id);


CREATE INDEX reservation_user_date_idx
  ON reservation (user_id, create_date);


CREATE INDEX user_info_idx
  ON user_information (user_id);


CREATE INDEX passport_user_idx
  ON passport (user_id);